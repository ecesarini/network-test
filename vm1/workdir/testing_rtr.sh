#!/bin/bash

echo "Getting env variables"
source var_cont.sh
source var_node.sh

#------------- Communication between VM --------------#
echo "Setting the rout on the node to reach the net ns"
ip route add $TO_BRIDGE_SUBNET via $TO_NODE_IP_SW dev enp0s8

echo "Enables IP forwarding on the node (-w stands for write)"
sysctl -w net.ipv4.ip_forward=1
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net# cat testing_rtr.sh
#!/bin/bash
source var_cont.sh
#source var_node.sh
#Check routes in container1
ip netns exec $NS1 ip route
#Examine what route to reach one container on VM2
ip route get $TO_IP1
#Ping a contgainer hosted on VM2 from a container hosted on this server
ip netns exec $NS1 ping -c 3 $TO_IP1