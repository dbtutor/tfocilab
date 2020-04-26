/*
resource "oci_core_vcn" "main" {
  count          = var.enable_network==true ? 1 : 0
  compartment_id = element(var.lab_compartment_ids, count.index)
  display_name   = "${var.lab_name} lab ${count.index + var.id_padding} VCN"
  cidr_block     = var.subnet_cidr
  dns_label      = var.lab_name
  freeform_tags  = { 
    name = "${var.lab_name}-${count.index + var.id_padding}"
  }
}

resource "oci_core_internet_gateway" "main" {
  count          = var.enable_network==true ? var.students : 0
  compartment_id = element(var.lab_compartment_ids, count.index)
  display_name   = "${var.lab_name} lab ${count.index + var.id_padding} Internet Gateway"
  vcn_id         = element(oci_core_vcn.main.*.id, count.index)  
  freeform_tags  = { 
    name = "${var.lab_name}-${count.index + var.id_padding}"
  }
}

resource "oci_core_route_table" "rt" {
  count          = var.enable_network==true ? var.students : 0
  compartment_id = element(var.lab_compartment_ids, count.index)
  display_name   = "${var.lab_name} lab ${count.index + var.id_padding} Route Table"
  vcn_id         = element(oci_core_vcn.main.*.id, count.index) 
	route_rules {
    destination_type  = "CIDR_BLOCK"
    destination       = "0.0.0.0/0"
		network_entity_id = element(oci_core_internet_gateway.main.*.id, count.index)
	}  
  freeform_tags  = { 
    name = "${var.lab_name}-${count.index + var.id_padding}"
  }
}

resource "oci_core_subnet" "main" {
  count          = var.enable_network==true ? var.students : 0
  compartment_id = element(var.lab_compartment_ids, count.index)
  display_name   = "${var.lab_name} lab ${count.index + var.id_padding} Subnet"
  vcn_id         = element(oci_core_vcn.main.*.id, count.index) 
  cidr_block     = var.subnet_cidr
  dns_label      = "lab${count.index + var.id_padding}"
	route_table_id = element(oci_core_route_table.rt.*.id, count.index) 
	security_list_ids = [element(oci_core_security_list.windows.*.id, count.index) ]
  #availability_domain = element(var.ad, count.index) TODO
	  
	timeouts {
    create = "10m"
  }  	
  freeform_tags  = { 
    name = "${var.lab_name}-${count.index + var.id_padding}"
  }  
}

resource "oci_core_security_list" "windows" {
  count          = var.enable_network==true ? var.students : 0
  compartment_id = element(var.lab_compartment_ids, count.index)
  display_name   = "${var.lab_name} lab ${count.index + var.id_padding} Subnet"
  vcn_id         = element(oci_core_vcn.main.*.id, count.index) 
	
  # outbound
  egress_security_rules {
    protocol    = "6" # tcp
    destination = "0.0.0.0/0"
  }

  # inbound
  ingress_security_rules {
    description = "RDP"    
    protocol  = "6" # tcp
    source    = "0.0.0.0/0"
    stateless = false   

    tcp_options {
      max = "3389"  
      min = "3389"
    }
  }

  ingress_security_rules {   
    description = "WinRM"    
    protocol  = "6" # tcp
    source    = "0.0.0.0/0"
    stateless = false 
    
    tcp_options {
      min = "5985" 
      max = "5986"
    }
  }

 # TODO - move to psft list?

  ingress_security_rules { 
    description = "PIA"   
    protocol    = "6" # tcp
    source      = "0.0.0.0/0"    
    stateless   = false 
    
    tcp_options {
      min = "8000"
      max = "8000"
    }
  }

  ingress_security_rules { 
    description = "SSH"   
    protocol    = "6" # tcp
    source      = "0.0.0.0/0"    
    stateless   = false 
    
    tcp_options {
      min = "22"
      max = "22"
    }
  }
}
*/