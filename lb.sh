#!/bin/bash
cat << END >> /tmp/haproxy.cfg
global
    maxconn 2048
    log /dev/log	local0
    log /dev/log	local1 notice
    chroot /var/lib/haproxy
    user haproxy
    group haproxy
    daemon

defaults
    log	global
    mode	http
    option	httplog
    option	dontlognull
    option  forwardfor
    option  http-server-close
    timeout connect 5000
    timeout client  50000
    timeout server  50000

frontend web-http
    bind IP_ADDRESS_LB:80
    default_backend web-backend

backend web-backend
    server web-1 IP_ADDRESS_WEB1:80 check
    server web-2 IP_ADDRESS_WEB2:80 check
END

yum -y update
yum -y install haproxy

mv /tmp/haproxy.cfg /etc/haproxy/haproxy.cfg
