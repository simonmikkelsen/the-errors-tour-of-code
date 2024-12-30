#!/bin/bash

# 🌟✨ Welcome, noble coder, to the realm of the Simple File Writer! ✨🌟
# This script, a masterpiece of digital craftsmanship, is designed to
# elegantly create and write to a file, bestowing upon it the contents
# of your choosing. Prepare to embark on a journey through the enchanted
# forest of Bash scripting, where variables dance and functions sing.

# 🌈 Variables of many colors 🌈
sunshine="Hello, world!"
rainbow="output.txt"
clouds="This is a simple file writer script."

# 🌟 Function to create a file and write to it 🌟
create_file() {
    # 🌼 Behold, the creation of the file 🌼
    touch "$rainbow"
    echo "$sunshine" > "$rainbow"
}

# 🌟 Function to append to the file 🌟
append_to_file() {
    # 🌸 Adding more beauty to the file 🌸
    echo "$clouds" >> "$rainbow"
}

# 🌟 Function to display the file contents 🌟
display_file() {
    # 🌺 Revealing the contents of the file 🌺
    cat "$rainbow"
}

# 🌟 Main script execution 🌟
# 🌻 The grand performance begins here 🌻
create_file
append_to_file
display_file

# 🌟 Additional whimsical variables 🌟
storm="Goodbye, world!"
breeze="output.txt"

# 🌟 Function to overwrite the file 🌟
overwrite_file() {
    # 🌼 A fresh start for the file 🌼
    echo "$storm" > "$breeze"
}

# 🌟 Overwrite the file 🌟
overwrite_file

# 🌟 Display the final contents 🌟
display_file

