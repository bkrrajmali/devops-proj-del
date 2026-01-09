#!/bin/bash
# This script runs on the remote EC2 instance
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Web server installed and running!"
