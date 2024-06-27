# Terraform Module Linode Firewall
A Terraform module to manage Linode firewall resources

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | ~> 2.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | ~> 2.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [linode_firewall.firewall](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_linode_firewall_count"></a> [linode\_firewall\_count](#input\_linode\_firewall\_count) | The number of firewall resources to create | `number` | n/a | yes |
| <a name="input_linode_firewall_inbound_policy"></a> [linode\_firewall\_inbound\_policy](#input\_linode\_firewall\_inbound\_policy) | The inbound policy for the firewall | `string` | `"DROP"` | no |
| <a name="input_linode_firewall_label"></a> [linode\_firewall\_label](#input\_linode\_firewall\_label) | The label for the Linode firewall resource | `string` | n/a | yes |
| <a name="input_linode_firewall_linodes"></a> [linode\_firewall\_linodes](#input\_linode\_firewall\_linodes) | A list of linodes that will use the firewall | `list(string)` | n/a | yes |
| <a name="input_linode_firewall_outbound_policy"></a> [linode\_firewall\_outbound\_policy](#input\_linode\_firewall\_outbound\_policy) | The outbound policy for the firewall | `string` | `"ACCEPT"` | no |
| <a name="input_linode_firewall_rules"></a> [linode\_firewall\_rules](#input\_linode\_firewall\_rules) | A map of firewall rules for the firewall resource | <pre>map(object({<br>    action   = string<br>    protocol = string<br>    ports    = string<br>    ipv4     = list(string)<br>    ipv6     = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Example Usage
```go
module "my-firewall" {
  source                  = "../terraform-module-linode-firewall"
  linode_firewall_label   = "my-firewall"
  linode_firewall_linodes = ["my-linode"]

  linode_firewall_rules = {
    inbound = {
      allow-http = {
        action   = "ACCEPT"
        protocol = "TCP"
        ports    = "80"
        ipv4     = ["0.0.0.0/0"]
        ipv6     = []
      },
      allow-ssh = {
        action   = "ACCEPT"
        protocol = "TCP"
        ports    = "22"
        ipv4     = ["10.0.0.0/24"]
        ipv6     = []
      }
    },
    outbound = {
      allow-dns = {
        action   = "ACCEPT"
        protocol = "HTTP"
        ports    = "80,443"
        ipv4     = ["0.0.0.0/0"]
        ipv6     = []
      },
      deny-ftp = {
        action   = "DENY"
        protocol = "TCP"
        ports    = "21"
        ipv4     = ["0.0.0.0/0"]
        ipv6     = []
      }
    }
  }
}

```
