#! /bin/bash

if [ "${1:-abort}" == 'abort' ]; then
    echo
    echo 'The specified option does not exist.'
    exit

elif [ $1 = 'start']; then
    TARGET_INTERFACES=($(ip link show | grep 'if' | awk '{print $2}' | sed s/@.*//g))
    HOSTNAME=`cat /etc/hostname`

    for TARGET_INTERFACE in ${TARGET_INTERFACES[@]}
        do
        tcpdump -i $TARGET_INTERFACE -w /tmp/${HOSTNAME}_${TARGET_INTERFACE}.pcap &
    done

elif [ $i = 'stop' ]; then
    TCPDUMP_PIDS=($(ps -ef | egrep ^tcpdump | awk '{print $2}'))

    for TCPDUMP_PIDS in ${TCPDUMP_PIDS}
        do
        kill -9 ${TCPDUMP_PIDS}
    done
fi