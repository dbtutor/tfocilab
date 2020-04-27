# https://github.com/cloudposse/terraform-null-label#simple-example
module "null_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  # namespace  = "eg"
  # stage      = "prod"
  # name       = "bastion"
  # attributes = ["public"]
  # delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
    "Snapshot"     = "true"
  }
}

module "indentity_compartment" {
  source                = "./modules/identity/compartment"
  #is_create_resource   = var.is_create_resource
  compartment_ocid	    = var.compartment_ocid
  compartment_name		  = var.compartment_name
  compartment_descr		  = var.compartment_descr
  freeform_tags         = module.null_label.tags
}

# Creating Child Compartment
module "indentity_compartment_child" {
  source                = "./modules/identity/compartment"
  compartment_ocid	    = module.indentity_compartment.CompartmentNameOutputs
  compartment_name		  = var.compartment_name_child
  compartment_descr		  = var.compartment_descr_child
  freeform_tags         = module.null_label.tags
}
