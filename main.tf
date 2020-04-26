
/*
module "admin" {
  source             = "./modules/admin" 
  enable_admin       = var.enable_admin
  lab_name           = var.lab_name
  students           = var.students
  tenancy_ocid       = var.tenancy_ocid
  top_compartment_id = var.top_compartment_id  
  
  providers          = {
    oci      = oci
    oci.home = oci.home
  }
}
*/

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





/*
module "networking" {
  source              = "./modules/networking"  
  enable_network      = var.enable_network
  lab_name            = var.lab_name
  students            = var.students
  # tenancy_ocid        = var.tenancy_ocid
  top_compartment_id  = var.top_compartment_id  
  lab_compartment_ids = module.admin.lab_compartment_ids  
}
*/
