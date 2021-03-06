
# Creating aws network with terraform

resource "aws_vpc" "Kel-Rock-vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Name = "Kel1-vpc"
  }
}

# creating public subnet1

resource "aws_subnet" "Prod-pub-sub_1" {
  vpc_id            = aws_vpc.Kel-Rock-vpc.id
  cidr_block        = var.public-subnet1-cidr
  availability_zone = var.az1


  tags = {
    Name = "Prod -pub-sub_1"
  }
}

# Creating public subnet2

resource "aws_subnet" "Prod-pub-sub_2" {
  vpc_id            = aws_vpc.Kel-Rock-vpc.id
  cidr_block        = var.public-subnet2-cidr
  availability_zone = var.az2

  tags = {
    Name = "Prod -pub-sub_2"
  }
}

# Creating public subnet3

resource "aws_subnet" "Prod-pub-sub_3" {
  vpc_id            = aws_vpc.Kel-Rock-vpc.id
  cidr_block        = var.public-subnet3-cidr
  availability_zone = var.az3

  tags = {
    Name = "Prod -pub-sub_3"
  }
}

# Creating private subnet1

resource "aws_subnet" "Prod-priv-sub_1" {
  vpc_id            = aws_vpc.Kel-Rock-vpc.id
  cidr_block        = var.private-subnet1-cidr
  availability_zone = var.az4

  tags = {
    Name = "Prod -priv-sub_1"
  }
}

# Creating private subnet2

resource "aws_subnet" "Prod-priv-sub_2" {
  vpc_id            = aws_vpc.Kel-Rock-vpc.id
  cidr_block        = var.private-subnet2-cidr
  availability_zone = var.az5

  tags = {
    Name = "Prod -priv-sub_2"
  }
}

# Creating a public route

resource "aws_route_table" "prod-pub-route-table" {
  vpc_id = aws_vpc.Kel-Rock-vpc.id

  route = []

  tags = {
    Name = "prod-pub-route-table"
  }
}

# Creating a private route

resource "aws_route_table" "prod-priv-route-table" {
  vpc_id = aws_vpc.Kel-Rock-vpc.id

  route = []

  tags = {
    Name = "prod-priv-route-table"
  }
}

# Public subnet association

resource "aws_route_table_association" "prod-pub-route-Assoc_1" {
  route_table_id = aws_route_table.prod-pub-route-table.id
  subnet_id      = aws_subnet.Prod-pub-sub_1.id

}

resource "aws_route_table_association" "prod-pub-route-Assoc_2" {
  route_table_id = aws_route_table.prod-pub-route-table.id
  subnet_id      = aws_subnet.Prod-pub-sub_2.id

}


resource "aws_route_table_association" "prod-pub-route-Assoc_3" {
  route_table_id = aws_route_table.prod-pub-route-table.id
  subnet_id      = aws_subnet.Prod-pub-sub_3.id

}

# private subnet association with route table

resource "aws_route_table_association" "pprod-priv-route-Assoc_1" {
  route_table_id = aws_route_table.prod-priv-route-table.id
  subnet_id      = aws_subnet.Prod-priv-sub_1.id

}


resource "aws_route_table_association" "prod-priv-route-Assoc_2" {
  route_table_id = aws_route_table.prod-priv-route-table.id
  subnet_id      = aws_subnet.Prod-priv-sub_2.id

}

# Creating internet gateway

resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.Kel-Rock-vpc.id

  tags = {
    Name = "Prod-igw"
  }
}

# Associating internet gateway with public route table

resource "aws_route" "Prod-igw-association" {
  route_table_id         = aws_route_table.prod-pub-route-table.id
  gateway_id             = aws_internet_gateway.Prod-igw.id
  destination_cidr_block = var.route-table

}

# creating Nat gateway for the private subnet.


# creating EIP
resource "aws_eip" "Prod-Nat-gateway-eip" {
  vpc = true

}

# Nat gateway
resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.Prod-Nat-gateway-eip.id
  subnet_id     = aws_subnet.Prod-pub-sub_1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}