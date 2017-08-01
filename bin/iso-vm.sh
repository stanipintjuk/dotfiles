#!/bin/bash
qemu-system-x86_64 -smp 8 -enable-kvm -cpu host -m 8G \
  -cdrom "$1"
