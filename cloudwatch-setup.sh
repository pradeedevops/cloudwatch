#!/bin/bash

echo "⬇️ Downloading CloudWatch Agent..."
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

echo "📦 Installing CloudWatch Agent..."
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

echo "🔍 Verifying agent installation..."
if ! which /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl >/dev/null; then
    echo "❌ CloudWatch Agent installation failed!"
    exit 1
fi

echo "✅ CloudWatch Agent installed successfully!"

echo "📁 Creating config file for metrics + Jenkins logs..."
sudo tee /opt/aws/amazon-cloudwatch-agent/bin/config.json > /dev/null <<EOF
{
  "agent": {
    "metrics_collection_interval": 60,
    "run_as_user": "root"
  },
  "metrics": {
    "append_dimensions": {
      "InstanceId": "\${aws:InstanceId}"
    },
    "metrics_collected": {
      "cpu": {
        "measurement": [
          "cpu_usage_idle",
          "cpu_usage_user",
          "cpu_usage_system"
        ],
        "metrics_collection_interval": 60,
        "totalcpu": true
      },
      "mem": {
        "measurement": [
          "mem_used_percent"
        ],
        "metrics_collection_interval": 60
      },
      "disk": {
        "measurement": [
          "disk_used_percent"
        ],
        "metrics_collection_interval": 60,
        "resources": [
          "/"
        ]
      },
      "diskio": {
        "measurement": [
          "io_time"
        ],
        "metrics_collection_interval": 60
      }
    }
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/jenkins/jenkins.log",
            "log_group_name": "JenkinsLogs",
            "log_stream_name": "{instance_id}-jenkins",
            "timestamp_format": "%Y-%m-%d %H:%M:%S"
          }
        ]
      }
    }
  }
}
EOF

echo "📂 Ensuring Jenkins log directory exists..."
sudo mkdir -p /var/log/jenkins
sudo touch /var/log/jenkins/jenkins.log
sudo chown -R ubuntu:ubuntu /var/log/jenkins

echo "🚀 Starting CloudWatch Agent..."
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
  -s

echo "✅ CloudWatch Agent is installed, configured, and running!"

