### Terraform OCI Workshop with Terraform Cloud

Please make sure you have added the following environment variables in Terraform Cloud Variables sections

- Tenancy OCID `tenancy_ocid` 
- User OCID `user_ocid`
- Fingerprint `fingerprint`
- Private Key `private_key` - Please be sure add only `private_key` no `path` and enter the contents of private keys by `cat ~/.oci/oci_api_key_public.pem`
- Region short code `region`
- Compartment OCID - `compartment_ocid` Note tenancy_ocid will be equals to root compartment_ocid
- ssh_public_key `ssh_public_key`
- ssh_private_key `ssh_private_key`

![image](https://user-images.githubusercontent.com/626498/80310496-a5b58f80-87f8-11ea-849d-6891822202e5.png)


#### Following 
`variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}`





