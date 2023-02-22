#!/bin/bash

echo "Getting env variables"
source var_cont.sh
source var_node.sh

echo "Creating the namespaces"
ip netns add $NS1
ip netns add $NS2
  ip netns show

echo "Creating the veth pairs (peer stands for corresponding peer)"
ip link add veth10 type veth peer name veth11
ip link add veth20 type veth peer name veth21
  ip link show type veth
    #ip link show veth11
    #ip link show veth21

echo "Adding the veth pairs to the namespaces"
ip link set veth11 netns $NS1
ip link set veth21 netns $NS2

echo "Configuring the interfaces in the network namespaces with IP addresses"
ip netns exec $NS1 ip addr add $IP1/24 dev veth11
ip netns exec $NS2 ip addr add $IP2/24 dev veth21

echo "Enabling the interfaces inside the network namespaces"
ip netns exec $NS1 ip link set dev veth11 up
ip netns exec $NS2 ip link set dev veth21 up

echo "Creating the bridge"
ip link add br0 type bridge
  ip link show type bridge
    ip link show br0
    #ip link delete br0
echo "Adding the network namespaces interfaces to the bridge"
ip link set dev veth10 master br0  #veth10 is enslaved by br0
ip link set dev veth20 master br0
echo "Assigning the IP address to the bridge"
ip addr add $BRIDGE_IP/24 dev br0
echo "Enabling the bridge"
ip link set dev br0 up
echo "Enabling the interfaces connected to the bridge"
ip link set dev veth10 up
ip link set dev veth20 up

echo "Setting the loopback interfaces in the network namespaces"
ip netns exec $NS1 ip link set lo up
ip netns exec $NS2 ip link set lo up
  ip netns exec $NS1 ip a
  ip netns exec $NS2 ip a

echo "Setting the default route in the network namespaces"
ip netns exec $NS1 ip route add default via $BRIDGE_IP dev veth11
ip netns exec $NS2 ip route add default via $BRIDGE_IP dev veth21
