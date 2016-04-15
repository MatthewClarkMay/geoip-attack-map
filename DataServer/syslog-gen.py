#!/usr/bin/python3

import random, syslog
from sys import exit
from time import sleep

#syslog_path = '/var/log/syslog/'

port_list = [
            0,
            1,
            20,
            21,
            22,
            23,
            25,
            40,
            43,
            53,
            80,
            88,
            109,
            110,
            115,
            118,
            143,
            156,
            161,
            220,
            389,
            443,
            445,
            636,
            1433,
            1434,
            3306,
            3389,
            5900,
            5901,
            5902,
            5903,
            8080,
            9999,
            ]

def main():
    #global syslog_path
    global port_list
    #with open(syslog_path, "w") as syslog_file:
    while True:
        port = random.choice(port_list)
        syslog.syslog('{}.{}.{}.{},{}.{}.{}.{},{},{}'.format(
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
                                                            ))

        sleep(.1)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        exit()
