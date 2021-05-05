#!/usr/bin/env bash

# Github issue: https://github.com/ValveSoftware/Proton/issues/3957
# Script: https://gist.github.com/dpino/6c0dca1742093346461e11aa8f608a99

# Modifications by me:
# * Always run script as sudo.
# * Fix DNS issue.
# * Fix no sound issue.
# * Execute steam directly (because that's all I need this script for).

# set -x

# Returns all available interfaces, except "lo" and "veth*".
available_interfaces()
{
   local ret=()

   local ifaces=$(ip li sh | cut -d " " -f 2 | tr "\n" " ")
   read -a arr <<< "$ifaces"

   for each in "${arr[@]}"; do
      each=${each::-1}
      if [[ ${each} != "lo" && ${each} != veth* ]]; then
         ret+=( "$each" )
      fi
   done
   echo ${ret[@]}
}

IFACE="eno2"
if [[ -z "$IFACE" ]]; then
   ifaces=($(available_interfaces))
   if [[ ${#ifaces[@]} -gt 0 ]]; then
      IFACE=${ifaces[0]}
      echo "Using interface $IFACE"
   else
      echo "Usage: ./ns-inet <IFACE>"
      exit 1
   fi
fi

NS="ns1"
VETH="veth1"
VPEER="vpeer1"
VETH_ADDR="10.200.1.1"
VPEER_ADDR="10.200.1.2"

trap cleanup EXIT

cleanup()
{
   sudo ip li delete ${VETH} 2>/dev/null
}

# Remove namespace if it exists.
sudo ip netns del $NS &>/dev/null

# Create namespace
sudo ip netns add $NS

# Create veth link.
sudo ip link add ${VETH} type veth peer name ${VPEER}

# Add peer-1 to NS.
sudo ip link set ${VPEER} netns $NS

# Setup IP address of ${VETH}.
sudo ip addr add ${VETH_ADDR}/24 dev ${VETH}
sudo ip link set ${VETH} up

# Setup IP ${VPEER}.
sudo ip netns exec $NS ip addr add ${VPEER_ADDR}/24 dev ${VPEER}
sudo ip netns exec $NS ip link set ${VPEER} up
sudo ip netns exec $NS ip link set lo up
sudo ip netns exec $NS ip route add default via ${VETH_ADDR}

# Enable IP-forwarding.
echo 1 > /proc/sys/net/ipv4/ip_forward

# Flush forward rules.
sudo iptables -P FORWARD DROP
sudo iptables -F FORWARD

# Flush nat rules.
sudo iptables -t nat -F

# Enable masquerading of 10.200.1.0.
sudo iptables -t nat -A POSTROUTING -s ${VPEER_ADDR}/24 -o ${IFACE} -j MASQUERADE

sudo iptables -A FORWARD -i ${IFACE} -o ${VETH} -j ACCEPT
sudo iptables -A FORWARD -o ${IFACE} -i ${VETH} -j ACCEPT

# Fix DNS issue
mkdir -p "/etc/netns/$NS"
ns_resolv=/etc/netns/"${NS}"/resolv.conf test -e ${ns_resolv} || ln -s /run/systemd/resolve/resolv.conf ${ns_resolv}

# Get into namespace
# ip netns exec ${NS} /bin/bash --rcfile <(echo "PS1=\"${NS}> \"")
sudo -E ip netns exec ns1 su - ${USER} -c "PULSE_SERVER=/run/user/$(id -u ${USER})/pulse/native PULSE_COOKIE=/home/${USER}/.config/pulse/cookie DISPLAY=:0 steam"
