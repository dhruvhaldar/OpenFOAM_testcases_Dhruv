#!/bin/bash

# Script to compress a folder using tar and split it into 50MB chunks.

# Usage: ./compress_and_split.sh <folder_path>

if [ $# -ne 1 ]; then
	  echo "Usage: $0 <folder_path>"
	    exit 1
fi

folder_path="$1"

if [ ! -d "$folder_path" ]; then
	  echo "Error: Folder '$folder_path' does not exist."
	    exit 1
fi

# Create a temporary filename for the tar archive
temp_tar_file=$(mktemp --suffix=".tar.xz")

# Compress the folder using tar -cJvf
echo "Compressing '$folder_path'..."
tar -cJvf "$temp_tar_file" "$folder_path"

if [ $? -ne 0 ]; then
	  echo "Error: Failed to compress '$folder_path'."
	    rm -f "$temp_tar_file"
	      exit 1
fi

# Split the tar archive into 50MB chunks
echo "Splitting '$temp_tar_file' into 50MB chunks..."
split -b 50M "$temp_tar_file" "${folder_path##*/}.tar.xz.part"

if [ $? -ne 0 ]; then
	  echo "Error: Failed to split '$temp_tar_file'."
	    rm -f "$temp_tar_file"
	      exit 1
fi

# Remove the temporary tar archive
rm -f "$temp_tar_file"

echo "Compression and splitting complete. Parts saved as '${folder_path##*/}.tar.xz.part*'."

# Example of how to recombine the parts.
echo "To recombine, use: cat ${folder_path##*/}.tar.xz.part* | tar -xJv"

exit 0
