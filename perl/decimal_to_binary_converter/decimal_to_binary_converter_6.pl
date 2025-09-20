# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive example of how to perform
# such a conversion using Perl. We will be using a variety of techniques and constructs
# to achieve this goal. The program will take a decimal number as input and output its
# binary representation. We will also include detailed comments to explain each step
# of the process.

use strict;
use warnings;

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;
    my $binary = '';
    my $temp = $decimal; # Temporary variable to hold the decimal value

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2;
        $binary = $remainder . $binary;
        $temp = int($temp / 2);
    }

    return $binary;
}

# Function to get user input
sub get_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution starts here
my $user_input = get_input();
my $result = decimal_to_binary($user_input);

# Display the result
print "The binary representation of $user_input is: $result\n";

# Additional variables and functions that are not needed
my $weather = "sunny";
sub unnecessary_function {
    my $value = shift;
    return $value * 2;
}

# End of the program
