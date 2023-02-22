#!/bin/bash
source var_cont.sh
source var_node.sh

#Prevent unsuccesful socat
#ps aux | grep socat | awk 'NR==1{print $2}' | xargs kill

#Remove potential previous tunudp link
#ip link delete tunudp

#Communication with other VM
echo "Setting the route on the node to reach the net ns"
ip route add $TO_BRIDGE_SUBNET via $NODE_IP_RTR_GW dev enp0s9

echo "Starts the UDP tunnel in the background"
socat UDP:$TO_NODE_IP_RTR_H:9000,bind=$NODE_IP_RTR_GW:9000 TUN:$TUNNEL_IP/16,tun-name=tundudp,iff-no-pi,tun-type=tun &

#Wait few seconds for tundudp
sleep 5

#Testing
echo "tundudp UP"
ip link set tundudp up

echo "Setting the MTU on the tun interface"
ip link set dev tundudp mtu 1492

echo "Enables IP forwarding on the node (-w stands for write)"
sysctl -w net.ipv4.ip_forward=1

#HERE
echo "Disables reverse path filtering"
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter'
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/enp0s3/rp_filter'
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/enp0s8/rp_filter'
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/enp0s9/rp_filter'
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/br0/rp_filter'
bash -c 'echo 0 > /proc/sys/net/ipv4/conf/tundudp/rp_filter'