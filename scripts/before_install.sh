#!/bin/bash
echo "Stopping existing .NET app if running..."
pkill -f "dotnet AWSCICDDemo.dll" || true
