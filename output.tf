output "ipv4_address / lb" {
  value = ["${digitalocean_droplet.lb.ipv4_address}"]
}

output "ipv6_address / lb" {
  value = ["${digitalocean_droplet.lb.ipv6_address}"]
}

output "ipv4_address / web" {
  value = ["${digitalocean_droplet.web.*.ipv4_address}"]
}

output "ipv6_address / web" {
  value = ["${digitalocean_droplet.web.*.ipv6_address}"]
}
