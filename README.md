# Our first AWS configuration for Terraform

An initial configuration for Terraform.

## Usage
````
$ terraform plan

$ terraform apply
````

## License
MIT


## About Terraform
Terraform uses a configuration loading model that allows us to treat individual directories, like tf-base, as standalone configurations or environments.

Each directory could represent an envvironment, stack, or application in our organization.

Terraform configuration files are normal text files. they are suffixed with either .tf or .tf.json.

The two configuration file formats are for two different tyoes of audiences:
- Humans: Uses HashiCorp Configuration Language or HCL
- Machines

HCL format is definitely easier to consume and we rec using it.


Everything within is an object. these objects can be providers, resources, etc. In the example below "provider" is a Component and "aws" is a resource.
````
provider "aws"{

}
````

Resources are the bread and butter of Terraform and represent the infrastructure components you want to manage: hosts, networks, firewalls, DNS entries, etc.

## Tips
When Trying to setup a VPC instance you may get error: : invalid or unknown key: vpc_id.
For instances, it seems like the correct thing to do is set is subnet_id and then vpc_id is inferred. I think the docs and examples could explain this better. https://github.com/hashicorp/terraform/issues/28#issuecomment-53793070

Find Ubuntu AMI's here
https://cloud-images.ubuntu.com/locator/ec2/

“Every Terraform plan or apply follows the same process:

1. We query the state of the resources, if they exist now.
2. We compare that state against any proposed changes to be made, building the graph of resources and their relationships. As a result of the graph, Terraform will only propose the set of required changes
3. “If they are not the same, either show the proposed change, if in the plan phase, or make the change, if in the apply phase.”

Destroy a specific resource:
terraform destroy -target=aws_eip

This command will save a plan that will destroy all resources as base-destroy-epochtime.plan.

$terraform plan -destroy -out base-destroy-`date +'%s'`.plan
