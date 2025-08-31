#!/bin/bash

# ---------------------------------------------------------
# AWS Resource Tracker Script with Log Rotation
# Author: Raafiya Gouher
# Date: 31-08-2025
# Description: Collects information about AWS resources (EC2, S3, IAM users, Lambda) and saves the output to a log file. Logs are rotated – only last 7 days are kept.
# ---------------------------------------------------------

# 1. Define base directory as the folder where script resides
BASE_DIR="$(dirname "$(realpath "$0")")"

# 2. Create logs directory if not exists
mkdir -p "$BASE_DIR/logs"

# 3. Set log file path with current date inside logs folder
LOG_FILE="$BASE_DIR/logs/aws_resource_tracker_$(date +%F).log"

# 4. Rotate logs: delete files older than 7 days
find "$BASE_DIR/logs" -type f -name "aws_resource_tracker_*.log" -mtime +7 -exec rm {} \;

# 5. Print header in log file
echo "======================================" >> "$LOG_FILE"
echo " AWS Resource Tracker - $(date) " >> "$LOG_FILE"
echo "======================================" >> "$LOG_FILE"

# 6. Track EC2 Instances
echo -e "\nEC2 Instances:" >> "$LOG_FILE"
aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,State:State.Name,AZ:Placement.AvailabilityZone}' \
  --output table >> "$LOG_FILE"

# 7. Track S3 Buckets
echo -e "\nS3 Buckets:" >> "$LOG_FILE"
aws s3 ls >> "$LOG_FILE"

# 8. Track IAM Users
echo -e "\nIAM Users:" >> "$LOG_FILE"
aws iam list-users \
  --query 'Users[*].{UserName:UserName,CreateDate:CreateDate}' \
  --output table >> "$LOG_FILE"

# 9. Track Lambda Functions
echo -e "\nLambda Functions:" >> "$LOG_FILE"
aws lambda list-functions \
  --query 'Functions[*].{FunctionName:FunctionName,Runtime:Runtime,LastModified:LastModified}' \
  --output table >> "$LOG_FILE"

# 10. Print completion message
echo -e "\nTracking Completed Successfully! Log saved to: $LOG_FILE"
