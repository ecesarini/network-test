#!/bin/bash

echo "Getting env variables"
source var_cont.sh
source var_node.sh

#------------- Communication between VM --------------#
echo "Setting the rout on the node to reach the net ns"
ip route add $TO_BRIDGE_SUBNET via $TO_NODE_IP_SW dev enp0s8

echo "Enables IP forwarding on the node (-w stands for write)"
sysctl -w net.ipv4.ip_forward=1