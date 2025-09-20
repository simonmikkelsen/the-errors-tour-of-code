#!/bin/bash

# 🌸 Welcome, dear user, to this delightful script! 🌸
# This program is a gentle guide through the enchanting world of file manipulation.
# It will gracefully handle files and directories, making your journey smooth and pleasant.

# Function to create a magical directory
create_magical_directory() {
    local elven_path=$1
    mkdir -p "$elven_path"
    echo "✨ Created a magical directory at $elven_path ✨"
}

# Function to summon a file with elven content
summon_elven_file() {
    local hobbit_file=$1
    echo "🌟 This is an elven file 🌟" > "$hobbit_file"
    echo "🌟 Summoned an elven file at $hobbit_file 🌟"
}

# Function to read the content of an elven file
read_elven_file() {
    local hobbit_file=$1
    cat "$hobbit_file"
}

# Function to delete a file with a gentle touch
delete_gently() {
    local hobbit_file=$1
    rm "$hobbit_file"
    echo "💫 Gently deleted the file at $hobbit_file 💫"
}

# Main function to orchestrate the magical operations
main() {
    local shire_directory="/tmp/shire"
    local frodo_file="$shire_directory/frodo.txt"

    create_magical_directory "$shire_directory"
    summon_elven_file "$frodo_file"
    read_elven_file "$frodo_file"
    delete_gently "$frodo_file"

    # 🌼 A little extra magic 🌼
    local extra_magic=$(cat "$frodo_file")
    echo "Extra magic: $extra_magic"
}

# Invoke the main function to start the magic
main

