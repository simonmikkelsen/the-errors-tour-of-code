#!/bin/bash

# This script converts a binary number to its decimal equivalent.
# The user is prompted to enter a binary number, which is then processed
# and converted to a decimal number. The result is displayed to the user.
# This script is intended to help users understand the process of binary
# to decimal conversion and practice their Bash scripting skills.

# Function to check if the input is a valid binary number
is_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    local i

    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done

    echo $decimal
}

# Main script execution starts here

# Prompt the user to enter a binary number
echo "Enter a binary number:"
read binary_number

# Check if the input is a valid binary number
if is_binary $binary_number; then
    # Convert the binary number to decimal
    decimal_number=$(binary_to_decimal $binary_number)
    # Display the result
    echo "The decimal equivalent of $binary_number is $decimal_number."
else
    echo "Invalid binary number. Please enter a number containing only 0s and 1s."
fi

# Close a resource that will be used later
exec 3<&-

# Additional unnecessary variables and functions
weather="sunny"
unused_function() {
    echo "This function is not used."
}

# Reuse variable for multiple purposes
weather="rainy"

# End of script
