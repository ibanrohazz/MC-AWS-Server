# MC-AWS-Server

Easily deploy Minecraft servers through AWS!

## Table of Contents

- [MC-AWS-Server](#mc-aws-server)
- [How to Deploy](#how-to-deploy)
- [How to Destroy](#how-to-destroy)
- [Uses](#uses)
- [Terraform](#terraform)

## How to Deploy

- Add variables to a `*.tfvars` file
- Add Terraform variables for a backend configuration
- `terraform init -backend-config="terraform_backend.config" -reconfigure`
- `terraform apply --var-file=andrewsway.tfvars`

## How to Destroy

- `terraform destroy --var-file=andrewsway.tfvars`

## Uses

## Terraform

For additional terraform documentation please refer to [TerraformTroubleshooting](/documentation/TerraformTroubleshooting.md)