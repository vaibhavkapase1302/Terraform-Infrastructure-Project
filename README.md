# Terraform-Infrastructure-Project

# Terraform Infrastructure Project

This project demonstrates the creation of an AWS infrastructure using Terraform. It sets up a Virtual Private Cloud (VPC) with subnets, EC2 instances, and an Application Load Balancer (ALB). The instances run a simple web application that serves dynamic content.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Customization](#customization)
- [Cleanup](#cleanup)
- [License](#license)

## Prerequisites

- AWS account with appropriate permissions
- Terraform CLI installed (version compatible with "provider.tf")
- AWS CLI installed and configured with valid credentials

## Getting Started

1. Clone this repository:

   ```bash
   git clone <repository_url>
   cd terraform-infrastructure-project


## Project Structure

This project is organized into several key files, each serving a specific purpose:

- `provider.tf`: This file defines the Terraform provider configuration, specifying the required AWS provider and settings.

- `main.tf`: The main Terraform configuration file where the infrastructure resources are defined. It includes the creation of a Virtual Private Cloud (VPC), subnets, EC2 instances, an Application Load Balancer (ALB), and more.

- `variable.tf`: This file defines variables that are used throughout the Terraform configuration. It provides a way to customize and parameterize the setup.

- `userdata1.sh` and `userdata2.sh`: These are user data scripts that are executed when launching the EC2 instances. They set up the instances, install necessary software (like Apache and AWS CLI), and configure the instances to serve web content.

- `README.md`: You are currently reading this file! It provides an overview of the project, instructions on how to set it up and use it, as well as explanations of the various files in the project.

Each of these files contributes to creating a cohesive and well-structured Terraform project that defines and deploys your desired AWS infrastructure.


## Configure AWS Credentials: 
Ensure you have your AWS credentials set up. You can configure them using environment variables, the AWS CLI, or other appropriate methods.
``` 
aws configure
```

```Access key ID```

```Secret access key```


