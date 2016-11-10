resource "digitalocean_droplet" "web" {
  count = "${var.web_count}"
  image = "${var.image}"
  name = "web${count.index+1}.${var.default_domain}"
  region = "${var.region}"
  size = "${var.web_size}"
  ssh_keys = [ "${var.ssh_fingerprint}" ]
  private_networking = true
  ipv6 = true

  connection {
    user     = "${var.user}"
    type     = "ssh"
    key_file = "${var.private_key}"
    timeout  = "2m"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [ "bash /tmp/web.sh" ]
  }
}

resource "digitalocean_droplet" "lb" {
  count = "${var.lb_count}"
  image = "${var.image}"
  name = "lb${count.index+1}.${var.default_domain}"
  region = "${var.region}"
  size = "${var.lb_size}"
  ssh_keys = [ "${var.ssh_fingerprint}" ]
  private_networking = true
  ipv6 = true

  connection {
    user     = "${var.user}"
    type     = "ssh"
    key_file = "${var.private_key}"
    timeout  = "2m"
  }

  provisioner "file" {
    source = "lb.sh"
    destination = "/tmp/lb.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/lb.sh",
      "sed -i 's/IP_ADDRESS_LB/${digitalocean_droplet.lb.ipv4_address}/g' /etc/haproxy/haproxy.cfg",
      "sed -i 's/IP_ADDRESS_WEB1/${digitalocean_droplet.web.0.ipv4_address_private}/g' /etc/haproxy/haproxy.cfg",
      "sed -i 's/IP_ADDRESS_WEB2/${digitalocean_droplet.web.1.ipv4_address_private}/g' /etc/haproxy/haproxy.cfg",
      "service haproxy start",
      "chkconfig haproxy on"
    ]
  }
}
