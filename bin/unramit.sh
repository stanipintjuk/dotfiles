#!/bin/bash

set -e 

folder_name="${1%/}"
in_ram="/dev/shm/$folder_name"
link_path="$(pwd)/$folder_name"

rm $link_path
cp -r $in_ram $link_path
rm -rf $in_ram
