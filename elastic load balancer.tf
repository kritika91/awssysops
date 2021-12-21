resource "aws_elb" "elb" {
	name = "elb"
	subnets =  [data.aws_cloudformation_export.publicsubnetid.value]
	listener {
		instance_port = 80
		instance_protocol = "http"
		lb_port = 80
		lb_protocol = "http"
	}
	health_check {
		healthy_threshold = 2
		unhealthy_threshold = 2
		timeout = 5
		target = "TCP:22"
		interval = 20
	}
}

resource "aws_lb_target_group" "test" {
	name = "elb-tg"
	port = 80
	protocol = "TCP"
	vpc_id = data.aws_cloudformation_export.vpcid.value
}