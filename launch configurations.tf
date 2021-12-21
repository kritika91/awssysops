resource "aws_launch_configuration" "launchconf" {
  name          = "web_config"
  image_id      = "${var.ami_id == "" ? data.aws_ami_ids.ubuntu.id : var.ami_id}"
  instance_type = var.instance_type
  security_groups = [data.aws_cloudformation_export.securitygroupid.value]
  key_name = var.key_name
  associate_public_ip_address = true
}