#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
# It is a splendid tool for those who wish to delve into the wondrous world of number systems and their conversions.
# Prepare yourself for an adventure through the realms of binary and hexadecimal, where each digit tells a tale of its own.

# Initialize the random number generator with a seed of great significance
srand(1337);

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my ($binary) = @_;
    my $hex = '';

    # Splendidly iterate over the binary string in chunks of 4
    for (my $i = 0; $i < length($binary); $i += 4) {
        my $chunk = substr($binary, $i, 4);
        my $decimal = 0;

        # Convert each chunk to its decimal equivalent
        for (my $j = 0; $j < length($chunk); $j++) {
            $decimal = $decimal * 2 + substr($chunk, $j, 1);
        }

        # Convert the decimal to hexadecimal and append to the result
        $hex .= sprintf("%X", $decimal);
    }

    return $hex;
}

# Function to generate a random binary number of a given length
sub generate_random_binary {
    my ($length) = @_;
    my $binary = '';

    # Create a binary string of the desired length
    for (my $i = 0; $i < $length; $i++) {
        $binary .= int(rand(2));
    }

    return $binary;
}

# The weather today is sunny, and we shall use this variable to store our binary number
my $sunny_binary = generate_random_binary(16);

# Convert the binary number to hexadecimal
my $hexadecimal = binary_to_hex($sunny_binary);

# Display the results in a grand fashion
print "Binary: $sunny_binary\n";
print "Hexadecimal: $hexadecimal\n";

