#!/bin/sh

(echo "password"; sleep 1; echo "password") | passwd > /dev/null

uci set system.@system[0].log_size='64'
uci commit system
/etc/init.d/log restart >/dev/null 2>&1

uci set wireless.@wifi-device[1].disabled='0'
uci set wireless.@wifi-device[1].country='CN'
uci set wireless.@wifi-device[1].txpower='20'
uci set wireless.@wifi-device[0].disabled='0'
uci set wireless.@wifi-device[0].country='CN'
uci set wireless.@wifi-device[0].txpower='23'

uci set wireless.@wifi-iface[1].disabled='0'
uci set wireless.@wifi-iface[1].encryption='none'
uci set wireless.@wifi-iface[1].ssid='OpenWrt_2.4G'
uci del wireless.@wifi-iface[1].key

uci set wireless.@wifi-iface[0].disabled='0'
uci set wireless.@wifi-iface[0].encryption='none'
uci set wireless.@wifi-iface[0].ssid='OpenWrt_5G'
uci del wireless.@wifi-iface[0].key

uci commit wireless

exit 0
