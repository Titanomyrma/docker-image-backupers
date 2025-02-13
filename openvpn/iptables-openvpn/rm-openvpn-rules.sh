#!/bin/sh
iptables -t nat -D POSTROUTING -s 10.8.0.0/24 -o wlp2s0 -j MASQUERADE
iptables -D INPUT -i tun0 -j ACCEPT
iptables -D FORWARD -i wlp2s0 -o tun0 -j ACCEPT
iptables -D FORWARD -i tun0 -o wlp2s0 -j DROP
iptables -D FORWARD -i enp1s0 -o tun0 -j ACCEPT
iptables -D FORWARD -i tun0 -o enp1s0 -j DROP
iptables -D FORWARD -i lo -o tun0 -j ACCEPT
iptables -D FORWARD -i tun0 -o lo -j DROP
iptables -D INPUT -i wlp2s0 -p udp --dport 1194 -j ACCEPT
