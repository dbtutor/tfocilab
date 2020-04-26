# data "oci_identity_compartments" "CompartmentFetch" {
#   compartment_id = oci_identity_compartment.CreateCompartmentName.[*].compartments

#   filter {
#     name   = "name"
#     values = ["*"]
#   }
# }