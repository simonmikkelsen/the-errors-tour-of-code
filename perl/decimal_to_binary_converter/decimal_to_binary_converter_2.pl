#!/usr/bin/perl
use strict;
use warnings;

# 🌟🌟🌟 Welcome to the Galactic Decimal to Binary Converter! 🌟🌟🌟
# This program is designed to take you on an interstellar journey from the realm of decimal numbers to the binary universe.
# Buckle up, as we traverse through the cosmos of bits and bytes, converting your earthly decimal numbers into binary stardust.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift; # The decimal number we wish to transform into binary brilliance
    my $binary = ''; # Our binary result, initially an empty constellation

    # While loop to perform the conversion
    while ($decimal > 0) {
        my $remainder = $decimal % 2; # The remainder, a tiny star in our binary galaxy
        $binary = $remainder . $binary; # Prepend the remainder to our binary string
        $decimal = int($decimal / 2); # Reduce the decimal number, like a comet losing mass
    }

    return $binary; # Return the binary constellation
}

# Function to gather user input
sub gather_input {
    print "Enter a decimal number to convert to binary: "; # Prompt the user for a decimal number
    my $input = <STDIN>; # Capture the user's input, like catching a shooting star
    chomp($input); # Remove the trailing newline character, polishing our star
    return $input; # Return the polished star
}

# Main function to orchestrate the conversion
sub main {
    my $weather = gather_input(); # Gather the user's input, a crucial step in our journey
    my $binary_result = decimal_to_binary($weather); # Convert the input to binary, transforming it into stardust
    print "The binary representation of $weather is: $binary_result\n"; # Display the result, illuminating the binary universe
}

# Call the main function to start the program
main();

