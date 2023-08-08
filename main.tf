# Create a VPC

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr    # Use the CIDR block from the variable "cidr" for the VPC.
}

# Create Subnet 1

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id   # Associate this subnet with the VPC created above.
  cidr_block              = "10.0.0.0/24"    # Set the CIDR block for the subnet.
  availability_zone       = "ap-south-1a"   # Place this subnet in availability zone ap-south-1a.
  map_public_ip_on_launch = true   # Automatically assign public IP on instance launch.
}

# Create Subnet 2

resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.myvpc.id   # Associate this subnet with the VPC created above.
  cidr_block              = "10.0.1.0/24"   # Set the CIDR block for the subnet.
  availability_zone       = "ap-south-1b"   # Place this subnet in availability zone ap-south-1b.
  map_public_ip_on_launch = true   # Automatically assign public IP on instance launch.
}

# Create an Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id    # Associate the internet gateway with the VPC.
}

# Create a Route Table

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id   # Associate this route table with the VPC.

  route {
    cidr_block = "0.0.0.0/0"    # Default route for all traffic.
    gateway_id = aws_internet_gateway.igw.id    # Route traffic through the internet gateway.
  }
}

# Create a security group named "websg" within the specified VPC.

resource "aws_security_group" "websg" {
  name   = "websg"
  vpc_id = aws_vpc.myvpc.id    # Associate this security group with the VPC.

  # Allow incoming HTTP traffic from any source.

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming SSH (TLS) traffic from any source.

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outgoing traffic.

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Attach a tag to the security group.

  tags = {
    Name = "Web-sg"
  }
}

# Create an S3 bucket named "example".

resource "aws_s3_bucket" "example" {
  bucket = "mybucket-vk-an-2023"
}

#############################


# Create EC2 Instance 1

resource "aws_instance" "webserver1" {
  ami                    = "ami-08e5424edfe926b43"   # Ubuntu Linux 2 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.websg.id]    # Associate with the security group "websg"
  subnet_id              = aws_subnet.sub1.id   # Use subnet sub1
  user_data              = base64encode(file("userdata1.sh"))    # Use user data script userdata1.sh
}


# Create EC2 Instance 2

resource "aws_instance" "webserver2" {
  ami                    = "ami-08e5424edfe926b43"    # Ubuntu Linux 2 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.websg.id]   # Associate with the security group "websg"
  subnet_id              = aws_subnet.sub2.id    # Use subnet sub2
  user_data              = base64encode(file("userdata2.sh"))    # Associate with the VPC
}


# Create an Application Load Balancer (ALB)

resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.websg.id]
  subnets         = [aws_subnet.sub1.id, aws_subnet.sub2.id]   # Associate ALB with specified subnets.
}

# Create an ALB Target Group

resource "aws_lb_target_group" "tg" {
  name     = "myTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id    # Associate the Target Group with the VPC

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

# Attach Instance 1 to the ALB Target Group

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.webserver1.id    # Attach to EC2 Instance 2
  port             = 80
}


# Attach Instance 2 to the ALB Target Group

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.webserver2.id   # Attach to EC2 Instance 2
  port             = 80
}

# Create an ALB Listener

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

output "loadbalancers" {
  value = aws_lb.myalb.dns_name   # Output the DNS name of the ALB for user reference.
}