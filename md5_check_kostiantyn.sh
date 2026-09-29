#!/bin/bash
#
# md5_check.sh
# This script checks the MD5 checksum of a file against a provided checksum.
read -p "Enter path for control:" dir_path
if [ ! -d "$dir_path" ]; then
    echo "Directory does not exist."
    exit 1
fi

read -p "Enter path for result file:" path_result
mkdir -p "$path_result"

result_file="$path_result/$(basename "$dir_path")_md5_sum.txt"

for file in "$dir_path"/*; do
    if [ -f "$file" ]; then
        md5sum "$file" >> "$result_file"
    fi
done

echo "MD5 checksums have been written to $result_file"
