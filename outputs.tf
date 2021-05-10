output "vpc_id" {
  value = ibm_is_vpc.rhpds.id
}

output "subnet_id" {
  value = ibm_is_subnet.rhpds.id
}

output "public_gateway_id" {
  value = ibm_is_public_gateway.rhpds.id
}
