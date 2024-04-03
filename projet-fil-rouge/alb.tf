# Create Load Balancer
resource "aws_elb" "my_elb" {
    name               = "my-elb"
    security_groups    = [aws_security_group.my_security_group.id]
    subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    cross_zone_load_balancing   = true

    listener {
        instance_port     = 80
        instance_protocol = "HTTP"
        lb_port           = 80
        lb_protocol       = "HTTP"
    }
}