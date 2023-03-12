#!/bin/bash
###############################
# Author: Kumar
# Date: 01-Dec-2019
# Version: V1
#
# This script will report the AWS usage.
################################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

set -x

### List All the S3 Buckets
echo "Print list of S3 Buckets"
aws s3 ls
echo "End of S3 Buckets"

### List All the EC2 Machines
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
echo "End of ec2 Instances"

### List All Lambda Functions
echo "Print list of Lambda Functions"
aws lambda list-functions
echo "End of Lambda Functions"

### List all IAM users
echo "Print list of IAM Users"
aws iam list-users
echo "End of IAM Users"