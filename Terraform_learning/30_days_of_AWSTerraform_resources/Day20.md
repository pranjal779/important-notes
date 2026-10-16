The data "tls_certificate" data source is provided by the HashiCorp TLS Provider. It is used to fetch a TLS certificate chain from a specific HTTPS URL, which is most commonly utilized to retrieve a certificate's SHA-1 fingerprint (thumbprint). [1, 2] 

This is a critical requirement when setting up OpenID Connect (OIDC) identity providers in cloud platforms like AWS (e.g., configuring AWS IAM roles for service accounts in Amazon EKS or configuring dynamic provider credentials for HCP Terraform). [3, 4] 

------------------------------
## 💻 Syntax & Usage 

## 1. Modern Configuration (TLS Provider v4.x+)
In modern versions of the provider, fetched attributes are organized inside a certificates block array. [3, 5] 

# Fetch the certificate chain
```hcl
data "tls_certificate" "example" {
  url = "https://githubusercontent.com"
}
```

# Create an OIDC provider using the retrieved certificate fingerprint
```hcl
resource "aws_iam_openid_connect_provider" "example" {
  url             = data.tls_certificate.example.url
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.certificates[0].sha1_fingerprint]
}
```

## 2. Legacy Configuration (TLS Provider v3.x or earlier)
If you are locked into using older provider versions (like v3.4.0), the fingerprint was exposed as a flat string attribute (sha1_fingerprint) directly on the data source root: [1] 

```hcl
resource "aws_iam_openid_connect_provider" "legacy_example" {
  url             = data.tls_certificate.example.url
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.sha1_fingerprint] 
}
```

------------------------------
## ⚙️ Arguments Reference

* url (String, Required): The initialization URL from which to download the certificate chain. Must begin with https://. [2] 
* verify_chain (Boolean, Optional): Dictates whether to verify the server's certificate chain against your system's trust store. Defaults to true.

------------------------------
## 📤 Exported Attributes
When leveraging certificates[0], you can access detailed information about the remote certificate: [1, 3] 

| Attribute | Type | Description |
|---|---|---|
| certificates[*].sha1_fingerprint | String | The SHA-1 fingerprint/thumbprint of the certificate (Hexadecimal format). |
| certificates[*].cert_pem | String | The complete certificate data string encoded in PEM format. |
| certificates[*].not_after | String | Expiration time timestamp formatted according to RFC 3339. |
| certificates[*].not_before | String | Activation/validity start time timestamp. |
| certificates[*].issuer | String | The entity that verified and signed the certificate. |
| certificates[*].subject | String | The entity to which the target certificate belongs. |

------------------------------
## ⚠️ Common Pitfalls

* Proxy Issues: If your Terraform setup runs behind an enterprise firewall or private network proxy, the data fetch might time out. You can configure a proxy block directly inside the provider "tls" {} block. [2] 
* Invalid index Error: If you upgrade or downgrade across the v3.x / v4.x barrier without adjusting data.tls_certificate.example.sha1_fingerprint vs data.tls_certificate.example.certificates[0].sha1_fingerprint, your code will fail to compile. [5] 

If you want, tell me:

* What cloud platform or service (AWS, GitHub, EKS, etc.) you are integrating with.
* What provider version your infrastructure codebase currently targets.

I can write out a complete, copy-pasteable OIDC or IAM resource block tailored to your exact use case.

[1] [https://registry.terraform.io](https://registry.terraform.io/providers/hashicorp/tls/3.4.0/docs/data-sources/certificate)
[2] [https://registry.terraform.io](https://registry.terraform.io/providers/hashicorp/tls/latest/docs)
[3] [https://www.hashicorp.com](https://www.hashicorp.com/en/blog/access-aws-from-hcp-terraform-with-oidc-federation)
[4] [https://registry.terraform.io](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/eks_cluster)
[5] [https://github.com](https://github.com/hashicorp/terraform/issues/31496)
