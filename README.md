# AWS Cloud Networking Exercise Repository

## Overview
Welcome to the AWS Cloud Networking Repository. This repository contains all the resources, practice exercises, and reference materials I used while exercising for Cloud Networking.

## Table of Contents
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Repository Structure](#repository-structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This repository is designed to help individuals preparing for the AWS Cloud Networking Skill Set. It includes a variety of study materials, hands-on labs, and reference documents that cover the key topics required for the exam.

## Getting Started
To get started with this repository, you will need to clone it to your local machine and ensure you have the necessary dependencies installed.

### Prerequisites
- Git
- Hashicorp Terraform
- AWS CLI

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/Macer-Park/AWS-NET-TER.git
    ```
2. Navigate to the project directory:
    ```bash
    cd AWS-NET-TER
    ```
3. Install the required dependencies:
    ```bash
    terraform plan or apply *.tf -parallelism=30
    ```

## Repository Structure
The repository is organized as follows:
- `/docs`: Documentation and study guides.
- `/exercises`: Hands-on lab exercises.
- `/scripts`: Utility scripts and automation tools.
- `/resources`: Additional reference materials.

## Usage
Each section of the repository contains detailed instructions and materials to aid in your study and practice. Here are some key highlights:
- **Docs**: Contains detailed study guides and notes on each topic.
- **Exercises**: Practical exercises to reinforce your understanding.
- **Scripts**: Helpful scripts to automate common tasks.
- **resources**: Real-world configurations to help understand best practices.

### Exercises Usage
Each lab lives in its own folder under `exercises/`. Run Terraform from inside that folder:
```bash
cd "exercises/Transit Gateway Exercise"
export TF_VAR_ssh_ingress_cidr="$(curl -s https://checkip.amazonaws.com)/32"
export TF_VAR_lab_root_password='choose-a-long-password'   # labs with private instances only
terraform init && terraform apply -parallelism=30
```

### Security Notes
These labs create real, billable AWS resources. Run `terraform destroy` when you finish.
- **SSH and ICMP** are open only to `ssh_ingress_cidr` (your own IP) and the lab's private `10.0.0.0/8` ranges. Only web ports and the VPN's IPsec port stay open to the internet.
- **Root password** for the private instances comes from `lab_root_password` at apply time and is never stored in this repository. Password and root login are accepted only from inside `10.0.0.0/8`; everything else keeps key-only SSH.
- **VPN pre-shared key** comes from `preshared_key` at apply time. The CGW script asks for the same value instead of using a fixed one.
- **Never commit** `*.tfvars` or `terraform.tfstate`. State files contain these values in plain text; `.gitignore` excludes them.
- Older commits in this repository's history contain a fixed lab password. It was only ever used on short-lived lab instances that no longer exist; do not reuse it anywhere.

Contributing
Contributions are welcome! If you have any improvements or additional resources to share, please follow these steps:

Fork the repository.
Create a new branch: git checkout -b feature/new-feature.
Make your changes.
Commit your changes: git commit -m 'Add new feature'.
Push to the branch: git push origin feature/new-feature.
Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

