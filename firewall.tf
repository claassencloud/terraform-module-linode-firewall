resource "linode_firewall" "firewall" {
  label = var.linode_firewall_label
  count = var.linode_firewall_count

  dynamic "inbound" {
    for_each = var.linode_firewall_rules["inbound"] != null ? var.linode_firewall_rules["inbound"] : {}
    content {
      label    = inbound.key
      action   = inbound.value["action"]
      protocol = inbound.value["protocol"]
      ports    = inbound.value["ports"]
      ipv4     = inbound.value["ipv4"]
      ipv6     = inbound.value["ipv6"]
    }
  }

  inbound_policy = var.linode_firewall_inbound_policy

  dynamic "outbound" {
    for_each = var.linode_firewall_rules["outbound"] != null ? var.linode_firewall_rules["outbound"] : {}
    content {
      label    = outbound.key
      action   = outbound.value["action"]
      protocol = outbound.value["protocol"]
      ports    = outbound.value["ports"]
      ipv4     = outbound.value["ipv4"]
      ipv6     = outbound.value["ipv6"]
    }
  }

  outbound_policy = var.linode_firewall_outbound_policy

  linodes = var.linode_firewall_linodes
}
