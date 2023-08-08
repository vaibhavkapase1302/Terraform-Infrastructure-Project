# Define a variable named "cidr" with a default value.

variable "cidr" {
  default = "10.0.0.0/16"    # Default CIDR block for the VPC.
}

# Associate subnet sub1 with the specified route table (RT).

resource "aws_route_table_association" "rtal" {
  subnet_id      = aws_subnet.sub1.id    # Associate with the subnet sub1.
  route_table_id = aws_route_table.RT.id    # Use the route table RT.
}

# Associate subnet sub2 with the specified route table (RT).

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.sub2.id    # Associate with the subnet sub2.
  route_table_id = aws_route_table.RT.id    # Use the route table RT.
}