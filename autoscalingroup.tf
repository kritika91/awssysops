resource "aws_autoscaling_group" "asg" {
  name                 = "asg-public"
  launch_configuration = aws_launch_configuration.launchconf.name
  min_size             = 2
  desired_capacity     = 2
  max_size             = 5
  vpc_zone_identifier  = [data.aws_cloudformation_export.publicsubnetid.value]
  #target_group_arns    = ["${aws_lb_target_group.test.arn}"]
  health_check_type    = "ELB"
  force_delete         = true
  

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "asg-ec2"
    propagate_at_launch = true
  }
}

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "asg_attachment_test" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.elb.id
}