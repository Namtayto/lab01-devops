# lab01-devops
## 👨‍💻 To run
1. By running the `aws configure` command, you can set your credentials for the current environment. Terraform will then use these credentials to authenticate. Ensure you have the AWS CLI installed and configured
```
aws configure
```
2. Initialize the working directory for Terraform, download required provider plugins, and set up the backend to store state
```
terraform init
```
3. Create an execution plan, showing what actions Terraform will take to update infrastructure based on the current configuration and state values
```
terraform plan
```
4. Execute the changes required to reach the desired infrastructure state as defined by the Terraform configuration, applying the execution plan
```
terraform apply
```

## :key: If you want to create your own key pair

1. Creating an SSH key pair on your local system serves as a secure and convenient method for authenticating
```
cd ec2
ssh-keygen -t rsa -b 2048 -f my-key
```
This will generate my-key and my-key.pub files in our ec2 directory. We will add the Public Key (my-key.pub) to the AWS instance and use the Private key (my-key) to authenticate ourselves when connecting to remote servers using SSH.
