# lab01-devops
## 👨‍💻 To run
1. Configure the AWS CLI to add the access key and secret key
```
aws configure
```
2. Initialize the working directory for Terraform, download required provider plugins, and set up the backend to store state
```
terraform init
```
3. Create an execution plan, showing what actions Terraform will take to update infrastructure based on the current configuration and stateble values
```
terraform plan
```
4. Execute the changes required to reach the desired infrastructure state as defined by the Terraform configuration, applying the execution plan
```
terraform apply
```
