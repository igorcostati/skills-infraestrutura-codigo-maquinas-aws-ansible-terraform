terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "labs-ec2"
  vpc_security_group_ids = ["sg-0f5934cb1eee431df","sg-0cd2567f755a6f5a4","sg-042cf664745e934ca"]
  /* user_data = <<-EOF
              #!/bin/bash
                cd /home/ubuntu
                echo "<h1>Feito com Terraform 2</h1>" > index.html
                nohup busybox httpd -f -p 8080 &
              EOF */
  tags = {
    Name = "primeira-instancia-1"
  }
}