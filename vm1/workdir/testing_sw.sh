#!/bin/bash
source var_cont.sh
#source var_node.sh
#Check routes in container1
ip netns exec $NS1 ip route
#Examine what route to reach one container on VM2
ip route get $TO_IP1
#Ping a contgainer hosted on VM2 from a container hosted on this server
ip netns exec $NS1 ping -c 3 $TO_IP1
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net#
root@ubuntu-vm-01:~/test-k8s-net# cat testing_sw.sh
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