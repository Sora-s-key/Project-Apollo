#!/usr/bin/env python

import scapy.all  as scapy
import argparse


def get_arguments():
    parser = argparse.ArgumentParser()
    parser.add_option("-t", "--target", dest="target", help="Target IP / IP range. ")
    (options, arguments) = parser.parse_args()
    return options

def scan(ip):
    arp_request = scapy.ARP(pdst=ip) #method in scapy #set the IP
    broadcast = scapy.Ether(dst="ff:ff:ff:ff:ff:ff") #virtual
    arp_request_broadcast = broadcast/arp_request #appends with /
    answered_list = scapy.srp(arp_request_broadcast, timeout=1, verbose=False)[0]
    clients_list = []

    for element in answered_list:
        client_dict = {"ip:": element[1].psrc, "mac:": element[1].hwsrc }
        clients_list.append(client_dict)
    return clients_list

def print_result(results_list):
    print("IP\t\t\tMAC Address\n-------------------------")
    for client in results_list:
        print( client["ip:"] + "\t\t" + client["mac:"] + "n")
options = get_arguments()
scan_result = scan(options.target)
print_result(scan_result)
