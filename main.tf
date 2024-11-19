data "ibm_resource_group" "rg" {
  name = var.resource_group
}

locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
  resource_group = data.ibm_resource_group.rg.id
}

resource "ibm_is_public_gateway" "pgw" {
  name = var.pgw_name
  resource_group = data.ibm_resource_group.rg.id
  vpc  = ibm_is_vpc.vpc.id
  zone = local.ZONE
}

resource "ibm_is_subnet" "subnet" {
  name = var.subnet_name
  vpc             = ibm_is_vpc.vpc.id
  resource_group = data.ibm_resource_group.rg.id
  zone            = local.ZONE
  public_gateway  = ibm_is_public_gateway.pgw.id
  total_ipv4_address_count = 256
}
