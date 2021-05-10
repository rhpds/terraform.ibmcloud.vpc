locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_is_vpc" "rhpds" {
  name = var.vpc_name
  resource_group = data.ibm_resource_group.rhpds.id
}

resource "ibm_is_public_gateway" "rhpds" {
  name = var.pg_name
  resource_group = data.ibm_resource_group.rhpds.id
  vpc  = ibm_is_vpc.rhpds.id
  zone = local.ZONE
}

resource "ibm_is_subnet" "rhpds" {
  name = var.subnet_name
  vpc             = ibm_is_vpc.rhpds.id
  resource_group = data.ibm_resource_group.rhpds.id
  zone            = local.ZONE
  public_gateway  = ibm_is_public_gateway.rhpds.id
  total_ipv4_address_count = 256
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_vpc_cluster.cluster.id
}
