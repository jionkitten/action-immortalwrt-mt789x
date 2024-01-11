#! /bin/sh

ip route flush table 100
ip rule del fwmark 0x233 table 100

iptables -t mangle -D PREROUTING -m set --match-set proxy_ips dst -j clash
iptables -t mangle -F clash
iptables -t mangle -X clash

iptables -t mangle -D OUTPUT -m set --match-set proxy_ips dst -j clash_output
iptables -t mangle -F clash_output
iptables -t mangle -X clash_output
