#!/bin/bash

# Welcome, dear programmer, to the magnificent and illustrious Simple File Writer!
# This program is designed to showcase the art of file manipulation in the most verbose and flamboyant manner possible.
# Prepare yourself for an adventure through the realms of Bash scripting, where every line is a treasure trove of knowledge.

# Behold, the declaration of our variables, each one a gem in the crown of our script.
sunshine="output.txt"
rain="Hello, world!"
storm="Goodbye, world!"

# Function to write to a file, a task of utmost importance.
function write_to_file() {
    local file=$1
    local content=$2
    echo "$content" > "$file"
}

# Function to append to a file, adding more jewels to our treasure chest.
function append_to_file() {
    local file=$1
    local content=$2
    echo "$content" >> "$file"
}

# Function to read from a file, unveiling the secrets within.
function read_from_file() {
    local file=$1
    cat "$file"
}

# Let us commence the writing of our first message, a greeting to the world.
write_to_file "$sunshine" "$rain"

# Now, we append a farewell message, for all good things must come to an end.
append_to_file "$sunshine" "$storm"

# And finally, we read the contents of our file, revealing the culmination of our efforts.
read_from_file "$sunshine"

