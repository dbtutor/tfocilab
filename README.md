### Terraform OCI Workshop with Terraform Cloud

Please make sure you have added the following environment variables in Terraform Cloud Variables sections

- Tenancy OCID `tenancy_ocid` 
- User OCID `user_ocid`
- Fingerprint `fingerprint` by using `cat ~/.oci/config`
- Private Key `private_key` - Please be sure add only `private_key` no `path` and enter the contents of private keys by `cat ~/.oci/oci_api_key_public.pem`
- Region short code `region`
- Compartment OCID - `compartment_ocid` Note tenancy_ocid will be equals to root compartment_ocid
- ssh_public_key `ssh_public_key`
- ssh_private_key `ssh_private_key`

#### Sample - How to get them

- private_key_path - `cat ~/.oci/oci_api_key.pem`
- ssh_public_key  - `cat ~/.ssh/id_rsa.pub`
- ssh_private_key - `cat ~/.ssh/id_rsa`
- Public key value in PEM format `cat ~/.oci/oci_api_key_public.pem`
- verify the fingerprint `cat ~/.oci/config`

![image](https://user-images.githubusercontent.com/626498/80310496-a5b58f80-87f8-11ea-849d-6891822202e5.png)


#### Following are the examples of using variables

`variables.tf`

```HCL
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
# Use private_key not private_key_path
variable "private_key" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}
```

`provider.tf`

```HCL
provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  # Use private_key not private_key_path
  private_key          = var.private_key
  region               = var.region
}
```

#### Troubleshooting

If you the the following error, then please make sure variables has been provided provided properly - 

```HCL
Error: Service error:NotAuthenticated. The required information to complete authentication was not provided or was incorrect.. http status code: 401. Opc request id: f3d755f51620785d4abe8a74015845e8/E0B7936CA17E70456C50A90A29417FCC/7E8A1852E77727701DBCE49767C65EB7
````


