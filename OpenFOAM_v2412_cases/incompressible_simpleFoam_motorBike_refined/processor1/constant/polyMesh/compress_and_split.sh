#!/bin/bash

# Script to compress a file using tar and split it into 50MB chunks.
# To recombine, use: cat faces.tar.xz.part* | tar -xJv
# Usage: ./compress_and_split_file.sh <file_path>

if [ $# -ne 1 ]; then
	  echo "Usage: $0 <file_path>"
	    exit 1
fi

file_path="$1"

if [ ! -f "$file_path" ]; then
	  echo "Error: File '$file_path' does not exist."
	    exit 1
fi

# Create a temporary filename for the tar archive
temp_tar_file=$(mktemp --suffix=".tar.xz")

# Compress the file using tar -cJvf
echo "Compressing '$file_path'..."
tar -cJvf "$temp_tar_file" "$file_path"

if [ $? -ne 0 ]; then
	  echo "Error: Failed to compress '$file_path'."
	    rm -f "$temp_tar_file"
	      exit 1
fi

# Split the tar archive into 50MB chunks
echo "Splitting '$temp_tar_file' into 50MB chunks..."
split -b 50M "$temp_tar_file" "${file_path##*/}.tar.xz.part"

if [ $? -ne 0 ]; then
	  echo "Error: Failed to split '$temp_tar_file'."
	    rm -f "$temp_tar_file"
	      exit 1
fi

# Remove the temporary tar archive
rm -f "$temp_tar_file"

echo "Compression and splitting complete. Parts saved as '${file_path##*/}.tar.xz.part*'."

# Example of how to recombine the parts.
echo "To recombine, use: cat ${file_path##*/}.tar.xz.part* | tar -xJv"

exit 0
