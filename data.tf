  data "aws_ami_ids" "ubuntu" {

    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-18.04-amd64-server-*"]
    }

    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["749788943876"] # Canonical
  }

  data "aws_cloudformation_export" "vpcid" {
    name = "CloudFormationStack-VPCId"
  }
  data "aws_cloudformation_export" "publicsubnetid" {
    name = "CloudFormationStack-PublicSubnetID"
  }
  data "aws_cloudformation_export" "privatesubnetid" {
    name = "CloudFormationStack-PrivateSubnetID"
  }
  data "aws_cloudformation_export" "securitygroupid" {
    name = "CloudFormationStack-SecurityGroupID"
  }
