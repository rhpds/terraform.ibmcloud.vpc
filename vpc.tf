locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_is_vpc" "rhpds" {
  name = var.vpc_name
  resource_group = data.ibm_resource_group.rhpds.id
  address_prefix_management = "manual"
}

resource "ibm_is_public_gateway" "rhpds" {
  name = "${ibm_is_vpc.rhpds.name}-pg"
  resource_group = data.ibm_resource_group.rhpds.id
  vpc  = ibm_is_vpc.rhpds.id
  zone = local.ZONE
}

resource "ibm_is_vpc_address_prefix" "rhpds" {
  name = "${ibm_is_vpc.rhpds.name}-ap"
  zone = local.ZONE
  vpc  = ibm_is_vpc.rhpds.id
  cidr = var.cidr_zone
}

resource "ibm_is_subnet" "sn1-zone" {
  name = "${ibm_is_vpc.rhpds.name}-sn1-zone"
  vpc             = ibm_is_vpc.rhpds.id
  resource_group = data.ibm_resource_group.rhpds.id
  zone            = local.ZONE
  ipv4_cidr_block = var.subnet1_zone
  public_gateway  = ibm_is_public_gateway.rhpds.id
  depends_on      = [ibm_is_vpc_address_prefix.rhpds]
}

resource "ibm_is_subnet" "sn2-zone" {
  name = "${ibm_is_vpc.rhpds.name}-sn2-zone"
  vpc             = ibm_is_vpc.rhpds.id
  resource_group = data.ibm_resource_group.rhpds.id
  zone            = local.ZONE
  ipv4_cidr_block = var.subnet2_zone
  public_gateway  = ibm_is_public_gateway.rhpds.id
  depends_on      = [ibm_is_vpc_address_prefix.rhpds]
}
