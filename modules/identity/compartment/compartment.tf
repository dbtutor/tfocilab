// Compartment Variables - 
// Only the necessary variables used otherwise will get error

variable "compartment_ocid" {
	type = string
}
variable "is_create_resource" {
    description = "Condition for creating resource"
	type = bool
    default = true
}
variable "compartment_name" {
	description = "Compartment Name goes here"
	type = string
}
variable "compartment_descr" {
	description = "Compartment Description goes here"
	type = string
}


// Creating the Compartment
// Unless enable_delete is explicitly set to true: Terraform will not delete compartments on destroy
// Remember that the tenancy OCID is simply same as the root compartment OCID

resource "oci_identity_compartment" "CreateCompartmentName" {
  #count          = var.is_create_resource == true ? 1 : 0
  compartment_id = var.compartment_ocid
  name           = var.compartment_name
  description    = var.compartment_descr
  enable_delete  = true  // true will cause this compartment to be deleted when running `terrafrom destroy`
}

