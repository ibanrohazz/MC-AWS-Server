output "instance_public_ip" {
  description = "Public IP address of the Minecraft EC2 instance"
  value       = aws_eip.minecraft.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.minecraft.id
}
