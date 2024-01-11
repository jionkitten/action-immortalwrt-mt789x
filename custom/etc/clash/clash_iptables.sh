#! /bin/sh

iptables -t mangle -N clash
iptables -t mangle -A clash -p tcp -j TPROXY --on-port 7895 --tproxy-mark 0x233
iptables -t mangle -A clash -p udp -j TPROXY --on-port 7895 --tproxy-mark 0x233
iptables -t mangle -A PREROUTING -m set --match-set proxy_ips dst -j clash

iptables -t mangle -N clash_output
iptables -t mangle -A clash_output -m mark --mark 0x233 -j RETURN
iptables -t mangle -A clash_output -p tcp -j MARK --set-mark 0x233
iptables -t mangle -A clash_output -p udp -j MARK --set-mark 0x233
iptables -t mangle -A OUTPUT -m set --match-set proxy_ips dst -j clash_output
