output "CompartmentNameOutputs" {
  value = oci_identity_compartment.CreateCompartmentName.id
}

//Show Outputs to User
output "CompartmentNameOutputsShow" {
  value = oci_identity_compartment.CreateCompartmentName
}