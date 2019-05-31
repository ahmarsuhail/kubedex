#!/bin/bash

# tc qdisc add dev eth0 root handle 1: htb default 20
# tc class add dev eth0 parent 1: classid 1:1 htb rate 32kbit 

# tc class add dev eth0 parent 1:1 classid 1:10 htb rate 32kbit \
#    burst 6k prio 1

# tc class add dev eth0 parent 1:1 classid 1:20 htb rate 32kbit \
#    burst 6k prio 2

# tc qdisc add dev eth0 parent 1:10 handle 10: sfq perturb 10
# tc qdisc add dev eth0 parent 1:20 handle 20: sfq perturb 10

# tc filter add dev eth0 parent 1:0 protocol ip prio 10 u32 \
#       match ip dport 10001 0xffff flowid 1:10


tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb 
tc class add dev eth0 parent 1: classid 1:1 htb rate 200kbit 

#Topic 1
tc class add dev eth0 parent 1:1 classid 1:2 htb rate 30kbit prio 0
tc qdisc add dev eth0 parent 1:2 handle 10: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 0 u32  match ip dport 10001 0xffff flowid 1:2

#Topic 2
tc class add dev eth0 parent 1:1 classid 1:3 htb rate 20kbit prio 1
tc qdisc add dev eth0 parent 1:3 handle 20: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32  match ip dport 10002 0xffff flowid 1:3

#Topic 3
tc class add dev eth0 parent 1:1 classid 1:4 htb rate 15kbit prio 2
tc qdisc add dev eth0 parent 1:4 handle 30: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 2 u32  match ip dport 10003 0xffff flowid 1:4

#Topic 4
tc class add dev eth0 parent 1:1 classid 1:5 htb rate 10kbit prio 3
tc qdisc add dev eth0 parent 1:5 handle 40: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 3 u32  match ip dport 10004 0xffff flowid 1:5

#Topic 5
tc class add dev eth0 parent 1:1 classid 1:6 htb rate 8kbit prio 4
tc qdisc add dev eth0 parent 1:6 handle 50: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32  match ip dport 10005 0xffff flowid 1:6

#Topic 6
tc class add dev eth0 parent 1:1 classid 1:7 htb rate 5kbit prio 5
tc qdisc add dev eth0 parent 1:7 handle 60: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 5 u32  match ip dport 10006 0xffff flowid 1:7

#Topic 6
tc class add dev eth0 parent 1:1 classid 1:8 htb rate 2kbit prio 6
tc qdisc add dev eth0 parent 1:8 handle 70: sfq perturb 10
tc filter add dev eth0 protocol ip parent 1:0 prio 6 u32  match ip dport 10006 0xffff flowid 1:8


# subscriber_id=$1
# topic_id=$2
# port=$3
# priority=$4
# netem_id=$5
# drop_rate=$6
# is_first_subscriber=$7
# is_first_topic=$8

# if [ $is_first_subscriber -eq 1 ] 
# then
#     tc qdisc del dev eth0 root
#     tc qdisc add dev eth0 root handle 1: htb 
# fi    

# if [ $is_first_topic -eq 1 ]
# then
#     tc class add dev eth0 parent 1: classid 1:$subscriber_id htb rate 112kbit ceil 112kbit 
# fi    

# tc class add dev eth0 parent 1:$subscriber_id classid 1:$topic_id htb rate $[$priority*32/7]kbit prio $priority
# tc qdisc add dev eth0 parent 1:$topic_id handle $netem_id:0 netem loss $drop_rate%
# tc filter add dev eth0 protocol ip parent 1:0 prio $priority u32  match ip dport $port 0xffff flowid 1:$topic_id





