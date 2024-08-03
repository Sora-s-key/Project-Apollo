#!/bin/bash
import time
import random
import psutil
import datetime

def print_cpu_usage():
    cpu_usage = psutil.cpu_percent(interval=1)
    print(f"CPU Usage: {cpu_usage}%")

def print_memory_usage():
    memory_info = psutil.virtual_memory()
    print(f"Memory Usage: {memory_info.percent}% used, {memory_info.available // (1024 ** 2)} MB available")

def print_disk_usage():
    disk_info = psutil.disk_usage('/')
    print(f"Disk Usage: {disk_info.percent}% used, {disk_info.free // (1024 ** 3)} GB free")

def print_network_activity():
    net_io = psutil.net_io_counters()
    print(f"Network Activity: {net_io.bytes_sent // (1024 ** 2)} MB sent, {net_io.bytes_recv // (1024 ** 2)} MB received")

def print_random_fact():
    facts = [
        "Honey never spoils.",
        "Bananas are berries, but strawberries aren't.",
        "A day on Venus is longer than a year on Venus.",
        "Octopuses have three hearts.",
        "There are more stars in the universe than grains of sand on all the Earth's beaches."
    ]
    print(f"Random Fact: {random.choice(facts)}")

def main():
    while True:
        print(f"Timestamp: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print_cpu_usage()
        print_memory_usage()
        print_disk_usage()
        print_network_activity()
        print_random_fact()
        print("=" * 40)
        time.sleep(2)

if __name__ == "__main__":
    main()
