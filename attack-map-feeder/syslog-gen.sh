#!/bin/bash

possible_ports=(0 1 20 21 22 23 25 40 43 53 80 88 109 110 115 118 143 156 161 220 389 443 445 636 1433 1434 3306 3389 5900 5901 5902 5903 8080 9999)

while true;
do
    for port in ${possible_ports[@]};
    do
        src_ip=$((RANDOM%=255))"."$((RANDOM%=255))"."$((RANDOM%=255))"."$((RANDOM%=255))
        #dst_ip=$((RANDOM%=255))"."$((RANDOM%=255))"."$((RANDOM%=255))"."$((RANDOM%=255))
        dst_ip="8.8.8.8"
        #port=${possible_ports[$RANDOM % ${#possible_ports[@]}]}
        src_port=$port
        dst_port=$port
        logger -t attack-map-sample "$src_ip,$dst_ip,$src_port,$dst_port,ATTACK!!!$port,JOOMLA$port"
        sleep .2 
    done
done
