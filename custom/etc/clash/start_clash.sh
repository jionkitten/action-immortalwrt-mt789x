#! /bin/sh

ip route add local default dev lo table 100
ip rule add fwmark 0x233 table 100

if ! ipset list proxy_ips > /dev/null; then
  ipset restore -f /etc/clash/proxy_ips
fi
/etc/clash/clash_iptables.sh
