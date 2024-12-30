# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is written to help programmers understand the conversion process in detail.
# It includes verbose comments to explain each step of the process.

use strict;
use warnings;

# Function to convert decimal to binary
sub decimal_to_binary {
    my ($decimal) = @_;
    my $binary = '';
    my $temp = $decimal; # Temporary variable to hold the decimal value

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2; # Calculate the remainder when divided by 2
        $binary = $remainder . $binary; # Append the remainder to the binary string
        $temp = int($temp / 2); # Update the temporary variable by dividing by 2
    }

    return $binary; # Return the binary representation
}

# Main program starts here
print "Enter a decimal number: ";
my $input = <STDIN>; # Read input from the user
chomp($input); # Remove newline character from the input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $binary_result = decimal_to_binary($input); # Call the conversion function
    print "The binary representation of $input is: $binary_result\n"; # Print the result
} else {
    print "Invalid input. Please enter a valid decimal number.\n"; # Error message for invalid input
}

# End of the program
