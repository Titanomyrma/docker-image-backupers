add-openvpn-rules.sh is started when iptables-OpenVPN service is started

rm-openvpn-rules.sh is started when iptables-OpenVPN service is stopped

both files are located /etc/iptables/ and they are needed for service firewall rule setup


service file is located /etc/systemd/system/iptasbles-openvpn.service 

file should be edited to work as intended even after reboot (Before rule must be set to After)


server.conf blocks vpn forward internet connection and pushes ip of servers in wlan