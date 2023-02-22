#!/bin/bash

#Setup network var
NS1="NS1"
NS2="NS2"
BRIDGE_SUBNET="172.16.1.0/24"
BRIDGE_IP="172.16.1.1"
IP1="172.16.1.2"
IP2="172.16.1.3"
TO_BRIDGE_SUBNET="172.16.0.0/24"
TO_BRIDGE_IP="172.16.0.1"
TO_IP1="172.16.0.2"
TO_IP2="172.16.0.3"

##Setup router case
TUNNEL_IP="172.16.1.100"
TO_TUNNEL_IP="172.16.0.100"