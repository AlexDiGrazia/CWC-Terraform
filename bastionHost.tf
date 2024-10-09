resource "aws_instance" "bastion_host" {
  ami                         = "ami-08a0d1e16fc3f61ea"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.private_subnet_ids[0]
  associate_public_ip_address = false
  vpc_security_group_ids             = [aws_security_group.bastion_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
 
  tags = {
    Name = "${var.app_name}-bastion-host"
  }
}