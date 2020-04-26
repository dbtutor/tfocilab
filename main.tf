provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
}


module "indentity_compartment" {
  source                = "./modules/identity/compartment"
  #is_create_resource    = var.is_create_resource
  compartment_ocid	    = var.compartment_ocid
  compartment_name		  = var.compartment_name
  compartment_descr		  = var.compartment_descr
}

# Creating Child Compartment
module "indentity_compartment_child" {
  source                = "./modules/identity/compartment"
  #is_create_resource    = var.is_create_resource
  compartment_ocid	    = module.indentity_compartment.CompartmentNameOutputs
  compartment_name		  = var.compartment_name_child
  compartment_descr		  = var.compartment_descr_child
}
