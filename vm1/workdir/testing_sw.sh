#!/bin/bash
source var_cont.sh
source var_node.sh
#---Testing---#

#Ping adaptor attached to NS1
ip netns exec $NS1 ping -c 3 172.16.0.2

#Ping the bridge
ip netns exec $NS1 ping -c 3 172.16.0.1

#Ping adaptor of the second container
ip netns exec $NS1 ping -c 3 172.16.0.3

#Ping the other server (VM2)
ip netns exec $NS1 ping -c 3 $TO_NODE_IP_SW

#Ping the bridge on the other server (VM2)
ip netns exec $NS1 ping -c 3 172.16.1.1

#Ping the first container on VM2
ip netns exec $NS1 ping -c 3 172.16.1.2

#Ping the second container on VM2
ip netns exec $NS1 ping -c 3 172.16.1.3