## Terraform Network Module

### Description
This module creates an AWS VPC with a public subnet, an internet gateway, and the required route tables to allow internet access.

### Usage

```hcl
module "network" {
  source              = "./network-module"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "my-vpc"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "eu-west-1"
}
```

### Outputs
- `vpc_id`: The ID of the created VPC.
- `public_subnet_id`: The ID of the public subnet.
- `internet_gateway_id`: The ID of the internet gateway.




## Ansible Playbook for Deploying my_app

### Overview
This Ansible playbook automates the deployment of `my_app` on an **Amazon Linux 2** instance identified by the AWS dynamic inventory tag `my_instance_dev`. It ensures dependencies are installed, fetches the application from Bitbucket, and sets up the necessary configurations.

### Variables
| Variable | Description |
|----------|-------------|
| `app_branch` | The branch of the repository to deploy (default: `main`) |
| `git_repo` | The Git repository URL |
| `tmp_dir` | Temporary directory for cloning the app |
| `dest_dir` | Destination directory (`/opt/my_app`) |
| `ssh_key_path` | Path to the SSH key for Bitbucket authentication |

### What This Playbook Does
1. Ensures the **webapps** group and **my_app_user** user exist.
2. Installs necessary dependencies (`git`, `python3-devel`, `nginx`).
3. Ensures the SSH key exists for accessing the private Bitbucket repo.
4. Clones `my_app` into a temporary directory.
5. Copies the application to `/opt/my_app`.
6. Runs `make install` to install the application.
7. Restarts **Nginx** to apply changes.

### Running the Playbook
```sh
ansible-playbook -i inventory/aws_ec2.yml deploy_app.yml"
```

### Outputs
After execution, the playbook provides a success message indicating that `my_app` has been deployed.
