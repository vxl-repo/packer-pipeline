packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "golden_image"
  instance_type = "t2.micro"
  access_key = AWS_ACCESS_KEY_ID
  secret_key = AWS_SECRET_ACCESS_KEY
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                 = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20221118"
      root-device-type     = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  tags = {
    Name  = "WebServer-GoldenImage"
  }
  ssh_username = "ubuntu"
}

build {
  name    = "golden_image"
  sources = ["source.amazon-ebs.ubuntu"]
  provisioner "shell" {
    script = "install.sh" 
  }
}
