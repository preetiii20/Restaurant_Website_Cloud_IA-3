# Jenkins CI/CD + Terraform Mini Project

## Project Overview

This project demonstrates a basic CI/CD workflow using Jenkins and Infrastructure as Code using Terraform.

The project is based on a Restaurant Website. Jenkins is used to automate source code integration, validation, testing, and deployment of the website to an AWS EC2 instance. Terraform is used to demonstrate the Infrastructure as Code concept by defining and provisioning AWS infrastructure.

---

## Project Location

The main project is located at:

```text
D:\Projects\Restaurent-website
```

The Terraform configuration files are located at:

```text
D:\Projects\Restaurent-website\terraform
```

The Terraform folder contains the following files:

```text
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

---

# Terraform Configuration

## Step 1: Open the Terraform Folder

Open PowerShell and navigate to the location where the Terraform files are present:

```powershell
cd D:\Projects\Restaurent-website\terraform
```

---

## Step 2: Initialize Terraform

Run the following command to initialize Terraform and download the required AWS provider:

```powershell
terraform init
```

---

## Step 3: Review the Infrastructure Plan

Run the following command to view the resources Terraform will create:

```powershell
terraform plan
```

---

## Step 4: Apply the Terraform Configuration

Run the following command to create the infrastructure:

```powershell
terraform apply
```

Type `yes` when Terraform asks for confirmation.

Terraform provisions the AWS EC2 instance based on the configuration defined in the Terraform files.

---

## Terraform Files

### main.tf

This file configures the AWS provider and defines the EC2 instance.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "restaurant_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "restaurant-key"

  tags = {
    Name = "Restaurant-Website-Server"
  }
}
```

### variables.tf

This file defines the variables used in the Terraform configuration.

```hcl
variable "aws_region" {
  description = "AWS region where the infrastructure will be created"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
```

### outputs.tf

This file displays information about the created EC2 instance.

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.restaurant_server.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.restaurant_server.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.restaurant_server.public_dns
}
```

### terraform.tfvars

This file provides values for the Terraform variables.

```hcl
aws_region    = "ap-south-1"
ami_id        = "ami-0c7632fb77f35db43"
instance_type = "t3.micro"
```

---

# Jenkins CI/CD Pipeline

## Jenkinsfile Location

The Jenkinsfile is located in the main project folder:

```text
D:\Projects\Restaurent-website\Jenkinsfile
```

The Jenkins pipeline performs the following stages:

1. **Checkout** – Retrieves the latest source code from the GitHub repository.
2. **Build and Validation** – Checks that the required website files are available.
3. **Test** – Performs basic validation of the website files.
4. **Deploy to EC2** – Transfers the website files to the AWS EC2 instance.
5. **Restart Nginx** – Updates the deployed website so that the latest changes become visible.

---

# CI/CD Workflow

The workflow of this project is:

```text
Developer Changes Website Code
            ↓
Push Changes to GitHub
            ↓
Jenkins Retrieves Latest Code
            ↓
Build and Validation
            ↓
Testing
            ↓
Deploy Website to AWS EC2
            ↓
Nginx Serves the Updated Website
```

---

# Technologies Used

- HTML
- CSS
- Git and GitHub
- Jenkins
- Terraform
- AWS EC2
- Nginx
- Windows PowerShell

---

# Infrastructure as Code

Terraform is used to demonstrate the Infrastructure as Code concept. Instead of manually creating infrastructure resources, the infrastructure configuration is written in `.tf` files.

The Terraform workflow consists of:

```text
Write Configuration
       ↓
terraform init
       ↓
terraform plan
       ↓
terraform apply
       ↓
AWS Infrastructure Provisioned
```

---

# Conclusion

This project demonstrates a complete basic DevOps workflow by combining Jenkins CI/CD automation with Terraform Infrastructure as Code.

Changes made to the Restaurant Website can be pushed to GitHub and processed through the Jenkins pipeline. The pipeline validates and tests the website and deploys the latest files to the AWS EC2 server. Terraform is used to define the cloud infrastructure through code.

This project provides practical experience with CI/CD automation, cloud deployment, Infrastructure as Code, and version control.
