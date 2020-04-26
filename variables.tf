// Terraform main.tf Variable 

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}


variable "operating_system" {
  default = "Oracle Linux"
} // Name for the OS

variable "operating_system_OAL" {
  default = "Oracle Autonomous Linux"
  description = "Oracle Autonomous Linux Description"
}

variable "operating_system_version" {
  default = "7.7"
} // OS Version

variable "is_create_resource" {
  description = "Condition for creating resource"
  type = bool
  default = true
}

variable "compartment_name" {
  type        = string
  default     = "DBTutor_TFCloud_Lab"
  description = "Compartment Name"
}

variable "compartment_descr" {
  type        = string
  default     = "DBTutor Productions Lab Compartment"
  description = "Compartment Descr"
}

variable "compartment_name_child" {
  type        = string
  default     = "PSFT_Child"
  description = "Child Compartment Name"
}

variable "compartment_descr_child" {
  type        = string
  default     = "PSFT Child Compartment"
  description = "Child Compartment Descr"
}

/*
# Variables to create Tag Namespace

variable "tags" {
  type = "map"
  default = {
    "DemoTagNamespace.Environment" = "poc"
    "DemoTagNamespace.Owner"       = "Me"
  }
}
variable "tag_names" { default = ["Environment", "Owner"] }

variable "tag_namespace_description" { default = "Tag namespace for all resources" }
variable "tag_namespace_name" { default = "DemoTagNamespace" }
variable "is_retired" { default = "false" }

variable "tag_description" { default = ["Environment purpose", "Owner for resource"] }

# IGW variables
variable "internet_gateway_enabled" { default = "true" }
variable "internet_gateway_display_name" { default = "MyIGW" }

variable "igw_route_table_rules_cidr_block" { default = "0.0.0.0/0" }

# VCN variables

variable "vcn_cidr_block" { default = "172.27.0.0/16" }
variable "vcn_display_name" { default = "MyVCN" }
variable "vcn_dns_label" { default = "demo" }

variable "route_table_display_name" {
  default = "MyRouteTable"
}

variable "ad_number" {
  default = "0"
}

variable "compartment_display_name" {
  default = "three-instances-poc"
}

variable "vcn_ingress_protocol" {
  default = "all"
}

# Applications security list variables

variable "private_security_list_name" {
  default = "MyPrivateSL"
}

variable "egress_destination" {
  default = "0.0.0.0/0"
}

variable "egress_protocol" {
  default = "all"
}

variable "ingress_source" {
  default = "0.0.0.0/0"
}

variable "ingress_protocol" {
  default = "6"
}

variable "ingress_stateless" {
  default = false
}



# Subnet variables

variable "cidr_block_subnet" {
  default = "172.27.0.0/24"
}

variable "display_name_subnet" {
  default = "poc-subnet"
}

variable "dns_label_subnet" {
  default = "poc"
}



variable "ingress_ports" {
  description = "all the ports for security list"
  default = [
    { minport     = 22
      maxport     = 22
      source_cidr = "0.0.0.0/0"
    },
    { minport     = 0
      maxport     = 0
      source_cidr = "172.27.0.0/16"
  }]
}

// INSTANCE VARIABLES

variable "operating_system" {
  default = "Oracle Linux"
} // Name for the OS

variable "operating_system_version" {
  default = "7.6"
} // OS Version

variable "shape_name" {
  default = "VM.Standard2.1"
} // Shape what to be used. Smallest shape selected by default

variable "source_type" {
  default = "image"
} // What type the image source is

variable "assign_public_ip" {
  default = "true"
} // This is server in public subnet it will have a public IP

variable "instance_variables" {
  description = "Map instance name to hostname"
  default = {
    "ForEach1" = "fe-1"
    "ForEach2" = "fe-2"
    "ForEach3" = "fe-3"
  }
}
variable "instance_create_vnic_details_hostname_label" {
  default = "ForEach"
}

variable "is_monitoring_disabled" {
  default = false
}


variable "instance_create_vnic_details_skip_source_dest_check" {
  default = false
}



variable "enable_admin" {
    description = "Enable Admin setup. If disabled, students count will need to be 1"
    default = true
}

variable "enable_network" {
    description = "Enable Network setup"
    default = true
}

variable "enable_util" {
    description = "Enable Utilities setup"
    default = true
}
variable "enable_client" {
    description = "Enable Client Tools instance setup on Windows"
    default = true
}

variable "enable_elk" {
    description = "Enable ELK instance setup on Linux"
    default = true
}

variable "enable_psft" {
    description = "Enable PeopleSoft instance setup on Linux"
    default = false
}

variable "enable_psft_win" {
    description = "Enable PeopleSoft instance setup on Windows"
    default = true
}

variable "top_compartment_id" {
    description = "The top level compartment used by the lab."
}

variable "lab_name" {
    description = "The name of the lab. Used as freeform tag and in other settings."
}

variable "students" {
    description = "The number of student environments needed for the lab."
    default = "1"
}

variable "id_padding" {
    description = "The amount of padding added to the student index number to get student id."
    default = "100"
}

variable "compartment_delete" {
    description = "Enable or disable deleting of compartments via terraform."
    default = "false"
} # TODO - can this always be true? too dangerous?

variable "oci_user_prefix" {
  description = "Prefix for OCI user logins."
  default     = "lab"
}

variable "ad" { 
  description = "Availability Domain"
}

variable "psft_hostname" {
    default = "psftlab"
    description = "PeopleSoft instance hostname"
}

variable "psft_shape" {
  default = "VM.Standard2.1"
  description = "Default PeopleSoft instance shape"
}

variable "psft_volume_id" {
    # TODO - this is fs, need hr too?
    description = "The volume id used for PeopleSoft instance storage."  
    default = "ocid1.bootvolumebackup.oc1.phx.abyhqljrneoy2anywnz2r4bwhvlsuqo7knecwulbwvt6ldhjnykipvtx3gya"
}

# variable "psft_volume_id_win" {
#     description = "The volume id used for PeopleSoft instance storage."
# }

variable "psft_volume_type" {
    description = "The volume type used for PeopleSoft instance storage."
    default = "volumeBackup"
}

variable "psft_image_id" {
    description = "The instance source id used for the PeopleSoft instance."
    default = "ocid1.appcataloglisting.oc1..aaaaaaaagzmhrqd4dlwbzpkc53mdh6ec7hk66gl7boke4ibjalknxokbpjia"
}

variable "psft_image_id_win" {
    description = "The instance source id used for the PeopleSoft instance."
    default = "ocid1.image.oc1.phx.aaaaaaaak52ibl2osw2roidmd5w4ylurfqwz7zh4ozymkfoe2ahbqmqpgerak"
}
variable "psft_image_type" {
    description = "The instance source type used for the PeopleSoft instance."
    default = "image"
}

variable "volume_perf" {
    description = "Performance setting for instance volumes. vpus_per_gb = [0,10,20]"
    default = "10"
}

variable "client_admin_user" {
    description = "The admin user for the Client Tools instance."
    default = "opc"
}

variable "client_admin_pass" {
    description = "The admin password for the Client Tools instance."
}

variable "instance_admin_pass" {
    description = "The admin password for the PeopleSoft Instance"
}

variable "client_hostname" {
    default = "lab-client"
    description = "Client Tools instance hostname."
}

variable "client_shape" {
  default = "VM.Standard2.1"
  description = "Client Tools instance shape."
}

variable "client_image_id" {
    description = "The instance source id used for the Client Tools instance."
    default = "ocid1.image.oc1.phx.aaaaaaaassmer6xzpukycnyznkbka45nyxmgybuyk3se2ysw6iytkunhgvxa"
}

variable "client_image_type" {
    description = "The instance source type used for the Client Tools instance."
    default = "image"
}

variable "elk_hostname" {
    default = "elklab"
    description = "ELK instance hostname"
}

variable "elk_shape" {
  default = "VM.Standard2.1"
  description = "Default ELK instance shape"
}

variable "elk_image_id" {
    description = "The instance source id used for the ELK instance."
    default = "ocid1.appcataloglisting.oc1..aaaaaaaagzmhrqd4dlwbzpkc53mdh6ec7hk66gl7boke4ibjalknxokbpjia"
}

variable "elk_image_type" {
    description = "The instance source type used for the ELK instance."
    default = "image"
}

variable "win_image_url" {
    description = "URL to use as the source for the Windows instance"
}

# variable "compartment_delete" {
#   default = "false"
#   description = "Enable or disable Compartment delete option"
# }

# variable "lab_id" {
#   default = ""
#   description = "Lab ID number assigned to student."
# }

# variable "top_compartment_id" {
#   default = "ocid1.compartment.oc1..aaaaaaaa3gkb7o2xuu3b3z6gal7c322lbivrz2raowtftlid2mf4quo7ypuq"
#   description = "Labs top level compartment ID"
# }

# variable "students" {
#   default     = "1"
#   description = "The number of VPCs to launch."
# }

# variable "subnet_cidr" {
#   description = "CIDR for the Private Subnet"
#   default     = "10.0.0.0/26"
# }

# variable "subnet_dns" {
#   description = "DNS label for the Private Subnet"
#   default     = "main"
# }

*/

