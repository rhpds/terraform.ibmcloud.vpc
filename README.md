# terraform.ibmcloud.vpc
Terraform templates to create a single zone VPC, a Subnet, and a Public Gateway that can be used to underpin a RHOIC cluster.

# Using the templates

## With the terraform CLI

```
$ git clone <this repo>
$ cd <this repo>
$ terraform init
$ terraform plan
$ terraform apply
```

And when you are done

```
$ terraform destroy
$ cd ..
$ rm -rf <this repo>
```

## With IBM Cloud Schematics

[IBM Cloud Schematics documentation](https://cloud.ibm.com/docs/schematics)

* Create workspace
* Create execution plan (action) pointed at this git repo
* Execute the plan

When completed you can simply delete the workspace which will run a delete and destroy all objects the workspace provisioned. 
