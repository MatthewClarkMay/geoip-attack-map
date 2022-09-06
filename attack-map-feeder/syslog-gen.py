#!/usr/bin/python3

import random, syslog
from const import PORTMAP
from sys import exit
from time import sleep

def main():

    port_list = []
    type_attack_list = []

    for port in PORTMAP:
        port_list.append(port)
        type_attack_list.append(PORTMAP[port])

    while True:
        port = random.choice(port_list)
        type_attack = random.choice(type_attack_list)
        cve_attack = 'CVE:{}:{}'.format(
                                random.randrange(1,2000),
                                random.randrange(100,1000)
                                )

        rand_data = '{}.{}.{}.{},{}.{}.{}.{},{},{},{},{}'.format(
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            random.randrange(1, 256),
                                                            port,
                                                            port,
                                                            type_attack,
                                                            cve_attack
                                                            )

        syslog.syslog(rand_data)
        print(rand_data)
        sleep(1)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        exit()
