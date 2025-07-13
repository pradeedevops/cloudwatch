curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
sudo apt  install awscli
clear
sudo apt update
sudo apt install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
vim cloudwatch-setup.sh
vim gitops-dashboard.json
chmod +x cloudwatch-setup.sh
./cloudwatch-setup.sh
ls
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
amazon-cloudwatch-agent.deb  aws  awscliv2.zip  cloudwatch-setup.sh  gitops-dashboard.json
ubuntu@ip-172-31-43-101:~$ aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
Unable to locate credentials. You can configure credentials by running "aws configure".
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
rm -rf gitops-dashboard.json 
vim gitops-dashboard.json 
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
rm -rf gitops-dashboard.json 
vim gitops-dashboard.json 
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
rm -rf gitops-dashboard.json 
vim gitops-dashboard.json 
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
rm -rf gitops-dashboard.json 
vim gitops-dashboard.json 
aws cloudwatch put-dashboard   --dashboard-name "GitOpsMonitoring"   --dashboard-body file://gitops-dashboard.json   --region ap-south-1
