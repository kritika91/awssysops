resource "aws_instance" "private-vm" {
  ami           = "${var.ami_id == "" ? data.aws_ami_ids.ubuntu.id : var.ami_id}"
  instance_type = var.instance_type

  security_groups = [data.aws_cloudformation_export.securitygroupid.value]

# Private Subnet assign to instance
  subnet_id = data.aws_cloudformation_export.privatesubnetid.value
  associate_public_ip_address = false

# key name
  key_name = var.key_name

  tags = {
    Name = "db-server"
  }

  user_data = <<-EOF
  #!/bin/sh
    sudo apt-get update
    sudo apt-get install unzip tree
    sudo apt-get install -y python-pip
    pip install boto3
  EOF

}