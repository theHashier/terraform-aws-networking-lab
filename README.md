# Terraform AWS Networking Lab

Production-style AWS networking architecture built with Terraform, featuring public/private subnets, NAT Gateway, and secure EC2 access via SSM.

---

## Why This Project

This project was built to demonstrate real-world AWS networking concepts and hands-on DevOps skills in preparation for cloud engineering roles.

It showcases how to design, deploy, and debug infrastructure using Infrastructure as Code (Terraform).

---

## Architecture Overview

* Custom VPC (`10.0.0.0/16`)
* Public Subnet (`10.0.1.0/24`)
* Private Subnet (`10.0.2.0/24`)
* Internet Gateway (IGW)
* NAT Gateway (Elastic IP)
* Route Tables (public + private)
* EC2 instances:

  * Public instance (accessible via browser)
  * Private instance (accessible via SSM only)

---

## Architecture Diagram

```text
Internet
   │
   ▼
[ Internet Gateway ]
   │
[ Public Subnet ]
   │        └── EC2 (public, nginx)
   │
[ NAT Gateway ]
   │
[ Private Subnet ]
   └── EC2 (SSM access only)
```

---

## Key Concepts Demonstrated

* Public vs Private Subnets
* Internet Gateway vs NAT Gateway
* Route Tables and Traffic Flow
* Security Groups and Least Privilege
* AWS Systems Manager (SSM) instead of SSH
* Terraform modules and environment separation

---

## Project Structure

```
terraform-labs/
├── modules/
│   ├── vpc/
│   └── ec2/
└── envs/
    └── dev/
        ├── main.tf
        └── terraform.tfstate
```

---

## How It Works

* Public EC2 instances receive a public IP and are reachable from the internet.
* Private EC2 instances do not have a public IP and cannot be accessed directly.
* Private instances use a NAT Gateway for outbound internet access.
* SSM is used instead of SSH for secure, keyless access via IAM.

---

## Prerequisites

* AWS account
* Terraform installed
* IAM role for EC2 with:

  * AmazonSSMManagedInstanceCore

---

## Usage

### Initialize Terraform

```
cd envs/dev
terraform init
```

### Apply Infrastructure

```
terraform apply
```

---

## Outputs

After apply:

```
terraform output
```

Example:

```
web_public_ip = "18.xxx.xxx.xxx"
```

---

## Access

* Public EC2:

  * Open browser using public IP

* Private EC2:

  * Connect via AWS Systems Manager (Session Manager)

---

## Destroy Infrastructure

```
terraform destroy
```

⚠️ This project creates a NAT Gateway which incurs cost. Always destroy resources after testing.

---

## Interview Topics Covered

This project helps answer common DevOps interview questions:

* What is the difference between Internet Gateway and NAT Gateway?
* Why can’t a private instance be accessed from the internet?
* How does NAT Gateway enable outbound connectivity?
* Why use SSM instead of SSH?
* How do you structure Terraform projects using modules?

---

## Learning Outcome

This project demonstrates the ability to:

* Design AWS networking from scratch
* Implement secure access patterns
* Structure Terraform code using modules
* Debug real-world connectivity issues
* Build production-style cloud infrastructure

---

## Future Improvements

* Remote state with S3 and DynamoDB locking
* CI/CD pipeline with GitHub Actions
* Multi-environment support (dev/stage/prod)
* Load balancer and auto scaling

---

## Author

Eugen Gaibu
GitHub: https://github.com/theHashier
