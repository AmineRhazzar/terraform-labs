# Terraform Challenges
---

## Challenge 1: Create an EC2 instance
Create an EC2 instance with an Amazon Linux 2 AMI, a t2.micro instance type, and an attached EBS volume. Use a public key to enable SSH access to the instance.

*Difficulty: Beginner*

## Challenge 2: Create an S3 bucket
Create an S3 bucket with server-side encryption enabled, versioning enabled, and a lifecycle policy that transitions objects to Glacier storage class after 30 days.

*Difficulty: Beginner*

## Challenge 3: Create an RDS instance
Create an RDS instance with a MySQL engine, a db.t2.micro instance class, and an encrypted storage volume. Use a random password for the master user and create a security group that allows access from a specific IP address.

*Difficulty: Intermediate*

## Challenge 4: Create an Elastic Load Balancer
Create an Elastic Load Balancer that distributes traffic across multiple EC2 instances. Use a security group that allows access to port 80 and 443, and configure the health checks to use HTTP on port 80.

*Difficulty: Intermediate*

## Challenge 5: Create a VPC
Create a VPC with two subnets, each in a different availability zone. Configure the subnets to use different route tables, and configure a NAT gateway in one of the subnets to enable outbound traffic from instances in the private subnet.

*Difficulty: Intermediate*

## Challenge 6: Create an Auto Scaling Group
Create an Auto Scaling Group that launches EC2 instances in response to changes in demand. Use a launch configuration that includes an Amazon Linux 2 AMI, a t2.micro instance type, and a user data script that installs and configures Nginx.

*Difficulty: Intermediate*

## Challenge 7: Create an IAM user
Create an IAM user with programmatic access and a policy that allows the user to read and write objects in a specific S3 bucket.

*Difficulty: Intermediate*

## Challenge 8: Use modules to create infrastructure
Create reusable Terraform modules that encapsulate infrastructure resources such as EC2 instances, RDS instances, and S3 buckets. Use these modules to create infrastructure for a web application.

*Difficulty: Advanced*

## Challenge 9: Use Terraform to manage Kubernetes resources
Create a Kubernetes cluster using Terraform and deploy a sample application to the cluster. Use Terraform to manage Kubernetes resources such as deployments, services, and config maps.

*Difficulty: Advanced*

## Challenge 10: Use Terraform to manage multiple environments
Create a Terraform configuration that can be used to deploy infrastructure to multiple environments such as dev, staging, and production. Use Terraform workspaces and variables to manage environment-specific configuration.

*Difficulty: Advanced*

---

These challenges cover a range of topics and difficulty levels, from basic infrastructure provisioning to advanced Kubernetes management and environment configuration. They are designed to help you practice and master Terraform concepts and techniques. Good luck!
