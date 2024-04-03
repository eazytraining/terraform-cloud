# Create Auto Scaling Group
resource "aws_autoscaling_group" "my_asg" {
    name                 = "my-asg"
    min_size             = 2
    max_size             = 3
    desired_capacity     = 2
    vpc_zone_identifier  = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    launch_configuration = aws_launch_configuration.my_lc.name
    load_balancers = [aws_elb.my_elb.name]
}

# Create Launch Configuration
resource "aws_launch_configuration" "my_lc" {
    name                 = "my-lc"
    image_id             = "ami-0d71ca6a78e324f68"  # Replace with your desired AMI ID
    instance_type        = "t3.micro"      # Replace with your desired instance type
    security_groups      = [aws_security_group.my_security_group.id]
}