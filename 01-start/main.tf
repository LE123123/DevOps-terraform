provider "local" {
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

resource "local_file" "foo" {
  # ${}의 의미는 string interperation이라고 합니다.
  # HCL에서 제공하는 변수, context에서 값을 가져오기 위함입니다.
  # path.module은 파일 디렉토리 경로를 뜻합니다.
  filename = "${path.module}/foo.txt"
  content  = "Hello World!"
}

data "local_file" "bar" {
  filename = "${path.module}/bar.txt"
}

output "file_bar" {
  value = data.local_file.bar
}

# Create a VPC
resource "aws_vpc" "foo" {
  # CIDR
  cidr_block = "10.123.0.0/16"

  tags = {
    "Name" = "This is test VPC in Terraform"
  }
}

output "vpc_foo" {
  value = aws_vpc.foo
}

data "aws_vpcs" "this" {}

output "vpcs" {
  value = data.aws_vpcs.this
}


