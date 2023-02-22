#!/bin/bash
source var_cont.sh
#source var_node.sh
#Check routes in container1
ip netns exec $NS1 ip route
#Examine what route to reach one container on VM2
ip route get $TO_IP1
#Ping a container hosted on other VM from a container hosted on this server
ip netns exec $NS1 ping -c 3 $TO_IP1