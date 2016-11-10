#
# Create default domain
#
resource "digitalocean_domain" "default" {
  name = "${var.default_domain}"
  ip_address = "${digitalocean_droplet.lb.ipv4_address}"
}

#
# Create A records
#
resource "digitalocean_record" "www_ipv4" {
  domain = "${digitalocean_domain.default.name}"
  type = "A"
  name = "www"
  value = "${digitalocean_droplet.lb.ipv4_address}"
}

resource "digitalocean_record" "lb1_ipv4" {
  domain = "${digitalocean_domain.default.name}"
  type = "A"
  name = "lb1"
  value = "${digitalocean_droplet.lb.ipv4_address}"
}

resource "digitalocean_record" "web1_ipv4" {
  domain = "${digitalocean_domain.default.name}"
  type = "A"
  name = "web1"
  value = "${digitalocean_droplet.web.0.ipv4_address}"
}

resource "digitalocean_record" "web2_ipv4" {
  domain = "${digitalocean_domain.default.name}"
  type = "A"
  name = "web2"
  value = "${digitalocean_droplet.web.1.ipv4_address}"
}

#
# Create AAAA records
#
resource "digitalocean_record" "www_ipv6" {
  domain = "${digitalocean_domain.default.name}"
  type = "AAAA"
  name = "www"
  value = "${digitalocean_droplet.lb.ipv6_address}"
}

resource "digitalocean_record" "lb1_ipv6" {
  domain = "${digitalocean_domain.default.name}"
  type = "AAAA"
  name = "lb1"
  value = "${digitalocean_droplet.lb.ipv6_address}"
}

resource "digitalocean_record" "web1_ipv6" {
  domain = "${digitalocean_domain.default.name}"
  type = "AAAA"
  name = "web1"
  value = "${digitalocean_droplet.web.0.ipv6_address}"
}

resource "digitalocean_record" "web2_ipv6" {
  domain = "${digitalocean_domain.default.name}"
  type = "AAAA"
  name = "web2"
  value = "${digitalocean_droplet.web.1.ipv6_address}"
}
