# Description
On this folder you will find examples on how to deploy a simple cluster with [Terraform](https://registry.terraform.io/providers/elastic/ec/latest).
#Pre-reqs
You should have installed on you local machine Terraform. [Here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) you can find the steps to achieve it.
#Usage
The usage of every folder is easy. You just have to create an API Key on Elastic Cloud (if you don't know how, [here](https://www.elastic.co/guide/en/cloud/current/ec-api-keys.html) is what you are looking for).
You should place your shiny new API Key into `ec-provider.tf` file.
Once installed, go inside the deployment folder of your choice and run:
1. Initialize the environment
```
terraform init
```
2. Create a plan
```
terraform plan
```
3. Execute the plan and say yes (do not hesitate, Terraform will know)
```
terraform apply
```
Once you are done with your tests (say yes again, don't be charged extra!)
```
terraform destroy
```
