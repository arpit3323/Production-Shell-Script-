#!/bin/bash

output_file="system_info.txt"

echo "System Information:" > "$output_file"
echo "___________________" >> "$output_file"
echo "Hostname: $(hostname)" >> "$output_file"
echo "Os: $(uname -a)" >> "$output_file"
echo "Memory: $(free -m)" >> "$output_file"
echo "System info saved to $output_file"


