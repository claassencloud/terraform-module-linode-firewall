variable "linode_firewall_label" {
  description = "The label for the Linode firewall resource"
  type        = string
}

variable "linode_firewall_count" {
  description = "The number of firewall resources to create"
  type        = number
}

variable "linode_firewall_inbound_policy" {
  description = "The inbound policy for the firewall"
  type        = string
  default     = "DROP"
}

variable "linode_firewall_outbound_policy" {
  description = "The outbound policy for the firewall"
  type        = string
  default     = "ACCEPT"
}

variable "linode_firewall_linodes" {
  description = "A list of linodes that will use the firewall"
  type        = list(string)
}

variable "linode_firewall_rules" {
  type = map(map(object({
    action   = string
    protocol = string
    ports    = string
    ipv4     = list(string)
    ipv6     = list(string)
  })))

  description = "A map of firewall rules for the firewall resource"
}
