# Terraform Infrastructure Project

This project demonstrates the creation of an AWS infrastructure using Terraform. It includes the setup of a Virtual Private Cloud (VPC), subnets, security groups, EC2 instances, and an Application Load Balancer (ALB) to distribute traffic between instances. The instances run a simple web application that serves dynamic content.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started) 
- [Project Structure](#project-structure)
- [Configure AWS Credentials](#Configure-AWS-Credentials)
- [Project Highlights](#project-highlights)
- [Terraform Commands](#terraform-commands)
- [Push Code files from Local to GitHub Repo using Git](#git-section)
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

```Access key ID:```

```Secret access key:```


## Project Highlights

### Provider Configuration (provider.tf):

- The AWS provider version is specified as "5.11.0". Ensure compatibility with your Terraform version.
- Ensure AWS credentials are properly configured using environment variables, AWS CLI configuration, or other methods.

### Variables (variable.tf):

- The `variable.tf` file defines a variable named `cidr` with a default value. This variable is used for the CIDR block of the VPC, enhancing flexibility and reusability.

### Main Configuration (main.tf):

- The main Terraform configuration file, `main.tf`, defines key resources such as VPC, subnets, security groups, instances, and the ALB.
- Consider using variables to make subnet CIDR blocks configurable.
- User data scripts are used to configure instances; however, they are currently identical for both instances.

### User Data Scripts (userdata1.sh and userdata2.sh):

- User data scripts (`userdata1.sh` and `userdata2.sh`) install Apache, AWS CLI, and create a simple HTML file.
- A text color animation adds an interesting touch.
- Instance IDs are retrieved and displayed in the HTML content.

### Outputs (main.tf):

- The `main.tf` file includes an output block that exports the DNS name of the ALB, allowing easy access to the load balancer's endpoint.

### Load Balancer Configuration (main.tf):

- An ALB is configured with a target group, listener, and target group attachments.
- This setup enables the distribution of incoming traffic between the two EC2 instances.


## Customization

Feel free to customize the project according to your requirements:

- Modify subnet CIDR blocks and other parameters in `main.tf`.
- Update user data scripts to tailor instance configurations.
- Explore additional AWS resources and Terraform features to expand the project.


## Terraform Commands:

1. Initialize Terraform:

```
terraform init
```

2. Validate the Configuration:

```
terraform validate
```

3. Plan the Infrastructure:

```
terraform plan
```

4. Apply the Configuration:

```
terraform apply
```

5. Cleanup:

```
terraform destroy
```

When you're finished experimenting, destroy the resources and avoid unnecessary charges.


## Git Section

Adding all code files from the local machine to Online GitHub Repo by using the Version control "Git"

Open the Git bash and type these commands step by step 

```
cd Downloads/
```

```
git clone https://github.com/vaibhavkapase1302/Terraform-Infrastructure-Project.git
```

```
ls
```

```
 cd Terraform-Infrastructure-Project
```

```
 cd ..
```

```
cd Downloads
```

```
cd  Terraform-Project-AN
```

```
ls
```

```
cp * "C:\Users\HP\Downloads\Terraform-Infrastructure-Project"
```

```
ls
```

```
pwd
```

```
cd ..
```

```
cd Terraform-Infrastructure-Project
```

```
ls
```

```
git add .
```

```
git commit -m "All files are added in the main repo from local machine"
```

```
git push origin main
```

```c
ls
```

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to customize the content further to provide more details about your project, its purpose, and any additional information you'd like to share.




