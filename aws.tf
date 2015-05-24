provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_vpc" "main" {
    cidr_block = "172.100.0.0/16"

    tags {
        Name = "main"
    }
}

resource "aws_subnet" "1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.100.0.0/20"
    availability_zone = "ap-northeast-1a"
    map_public_ip_on_launch = true

    tags {
        Name = "1a"
    }
}

resource "aws_subnet" "1c" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.100.16.0/20"
    availability_zone = "ap-northeast-1c"
    map_public_ip_on_launch = true

    tags {
        Name = "1c"
    }
}
