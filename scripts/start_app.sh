#!/bin/bash
echo "Starting AWSCICDDemo Web API..."
cd /var/www/awscicddemo
nohup dotnet AWSCICDDemo.dll > /dev/null 2>&1 &
