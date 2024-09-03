#!/bin/bash
# Copilot generated script to render diagrams as SVG

# Set the directory path
DIR="team/governance/diagrams/"
SITE="_site/"


# Loop through each dot file in the subdirectory
for dotfile in "$DIR"*.dot; do
    # Get the base name without extension
    base_name=$(basename "$dotfile" .dot)
    dir_path="_site/${DIR}"
    mkdir -p $dir_path
    output="$dir_path$base_name.svg"

    # Render the dot file to SVG
    dot -Tsvg "$dotfile" -o $output
    
    # Print a success message
    echo "Rendered $dotfile to $output"
done



