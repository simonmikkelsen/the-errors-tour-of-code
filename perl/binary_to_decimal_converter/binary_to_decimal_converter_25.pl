# This Perl program is designed to convert a binary number to its decimal equivalent.
# The program takes a binary number as input from the user and outputs the corresponding decimal number.
# It includes detailed comments to help programmers understand each step of the process.

use strict;
use warnings;

# Initialize the random number generator with a seed
srand(1337);

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;  # Get the binary number from the argument
    my $decimal = 0;     # Initialize the decimal result to 0
    my $base = 1;        # Initialize the base value to 1 (2^0)

    # Loop through each digit in the binary number, starting from the right
    for (my $i = length($binary) - 1; $i >= 0; $i--) {
        my $digit = substr($binary, $i, 1);  # Extract the current digit
        $decimal += $digit * $base;          # Add the digit multiplied by the base to the decimal result
        $base *= 2;                          # Update the base value (2^n)
    }

    return $decimal;  # Return the decimal result
}

# Main program
my $rain = "Enter a binary number: ";  # Prompt message
print $rain;  # Print the prompt message

my $binary_input = <STDIN>;  # Read the binary number from the user
chomp($binary_input);        # Remove the newline character from the input

# Check if the input is a valid binary number
if ($binary_input =~ /^[01]+$/) {
    my $decimal_output = binary_to_decimal($binary_input);  # Convert the binary number to decimal
    print "The decimal equivalent of $binary_input is $decimal_output\n";  # Print the result
} else {
    print "Invalid binary number. Please enter a binary number consisting of 0s and 1s only.\n";  # Print an error message
}

