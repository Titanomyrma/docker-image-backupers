#!/bin/sh
iptables -t nat -I POSTROUTING 1 -s 10.8.0.0/24 -o wlp2s0 -j MASQUERADE
iptables -I INPUT 1 -i tun0 -j ACCEPT
iptables -I FORWARD 1 -i wlp2s0 -o tun0 -j ACCEPT
iptables -I FORWARD 1 -i tun0 -o wlp2s0 -j DROP
iptables -I FORWARD 1 -i enp1s0 -o tun0 -j ACCEPT
iptables -I FORWARD 1 -i tun0 -o enp1s0 -j DROP
iptables -I FORWARD 1 -i lo -o tun0 -j DROP
iptables -I FORWARD 1 -i tun0 -o lo -j DROP
iptables -I INPUT 1 -i wlp2s0 -p udp --dport 1194 -j ACCEPT
iptables -I FORWARD 1 -i tun0 -o wlp2s0 -d 192.168.31.168 -p tcp --dport 3000 -j ACCEPT
