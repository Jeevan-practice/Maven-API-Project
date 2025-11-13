resource "aws_vpc" "maven-vpc" {
  cidr_block = var.cidr_block
  
  tags = {
    Name        = "maven-vpc"
    Environment = "dev"
    Project     = "Maven-API"
  }
}
resource "aws_subnet" "maven-private-subnet" {
  count=length(var.private_cidr_block)
  vpc_id = aws_vpc.maven-vpc.id
  cidr_block = element(var.private_cidr_block,count.index)
  availability_zone = var.availability_zone
  
  tags = {
    Name        = "maven-private-subnet-${count.index + 1}"
    Environment = "dev"
    Project     = "Maven-API"
    Type        = "Private"
  }
}
resource "aws_subnet" "maven-public-subnet" {
  count=length(var.public_cidr_block)
  vpc_id = aws_vpc.maven-vpc.id
  cidr_block = element(var.public_cidr_block,count.index)
  availability_zone = var.availability_zone
  
  tags = {
    Name        = "maven-public-subnet-${count.index + 1}"
    Environment = "dev"
    Project     = "Maven-API"
    Type        = "Public"
  }
}
resource "aws_internet_gateway" "maven-IG" {
  vpc_id = aws_vpc.maven-vpc.id

  tags = {
    Name        = "maven-igw"
    Environment = "dev"
    Project     = "Maven-API"
  }
}

resource "aws_route_table" "maven-public-route" {
  vpc_id = aws_vpc.maven-vpc.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.maven-IG.id
  }

  tags = {
    Name        = "maven-public-rt"
    Environment = "dev"
    Project     = "Maven-API"
    Type        = "Public"
  }
}
resource "aws_route_table" "maven-private-route" {
  vpc_id = aws_vpc.maven-vpc.id
  
  tags = {
    Name        = "maven-private-rt"
    Environment = "dev"
    Project     = "Maven-API"
    Type        = "Private"
  }
}

resource "aws_route_table_association" "public-association" {
  subnet_id = aws_subnet.maven-public-subnet[0].id
  route_table_id = aws_route_table.maven-public-route.id
}
resource "aws_route_table_association" "private-association" {
    subnet_id = aws_subnet.maven-private-subnet[0].id
    route_table_id = aws_route_table.maven-private-route.id
  
}

