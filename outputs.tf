// Module Outputs

output "compartment_parent" {
  value = module.indentity_compartment
}

output "compartment_child" {
  value = module.indentity_compartment_child
}

/*
output "instance_psft_elk_ip" {
  value = module.instance-elk.public_ip
}
*/