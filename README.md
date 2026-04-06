# Terraform AWS Networking Lab

This project demonstrates a production-style AWS networking architecture built with Terraform.

It includes a custom VPC, public and private subnets, internet access via an Internet Gateway and NAT Gateway, and EC2 instances deployed in both layers.

The goal of this lab is to showcase hands-on understanding of cloud networking, infrastructure as code, and secure access patterns used in real-world environments.

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

## Key Concepts Demonstrated

* Public vs Private Subnets
* Internet Gateway vs NAT Gateway
* Route Tables and Traffic Flow
* Security Groups and Least Privilege
* AWS Systems Manager (SSM) for secure access
* Terraform modules and environment structure

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
* SSM is used instead of SSH for secure access without opening ports.

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

### Access

* Public EC2:

  * Open browser using public IP
* Private EC2:

  * Connect via AWS Systems Manager (Session Manager)

---

## Destroy Infrastructure

```
terraform destroy
```

Important: This project creates a NAT Gateway which incurs cost. Always destroy resources after testing.

---

## Learning Outcome

This project demonstrates the ability to:

* Design AWS networking from scratch
* Implement secure access patterns
* Structure Terraform code using modules
* Debug real-world connectivity issues

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
