#!/bin/bash

set -e


# setup dir structure in shm
echo "Making sure filestructure is correct..."
rammit_prefix="rammit"
shm_path="/dev/shm"
rammit_path="$shm_path/$rammit_prefix"
mkdir -p rammit_path

original_name="${1%/}"
bkp_name="$original_name.rammed"
in_shm_dirname="$rammit_path/$original_name"

original_full_path="$(pwd)/$folder_name"
bpk_full_path="$(pwd)/$bkp_name"

mv "$original_full_path" "$bpk_full_path.rammed"
cp -A "$bkp_full_path" "$in_shm_dirname"
ln -s "$in_shm_dirname" "$original_full_path"
