### Terraform Base Configuration File
### API based Authentication details for Oracle Cloud Infrastructure Provider
### https://www.terraform.io/docs/providers/oci/index.html#api-key-based-authentication
### terraform apply -var-file="terraform.tfvars"

#tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
#user_ocid = "ocid1.user.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
#fingerprint = "99:99:99:99:99:99:99:99:99:99:99:99:99:99:99:99"
#private_key_path = "~/.oci/oci_api_key.pem"

### Region
### https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#RegionsandAvailabilityDomains
### oci iam region list --output table
#region = "ap-mumbai-1"

### Compartment
### Keep in mind tenancy_ocid will be equals to root compartment_ocid 
#compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

### Public/private keys used on the instance
### https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingkeypairs.htm
#ssh_public_key = "cat ~/.ssh/id_rsa.pub"
#ssh_private_key = "cat ~/.ssh/id_rsa"
