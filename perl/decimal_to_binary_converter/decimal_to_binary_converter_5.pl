# This Perl program is designed to convert a decimal number into its binary equivalent.
# The program takes a decimal number as input from the user and outputs the binary representation.
# It is a great exercise for understanding number systems and practicing Perl programming.
# The program includes various functions and variables to demonstrate different aspects of Perl.

use strict;
use warnings;

# Function to convert decimal to binary
sub decimal_to_binary {
    my ($decimal) = @_;
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
sub get_user_input {
    print "Please enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution starts here
my $user_input = get_user_input();
my $binary_result = decimal_to_binary($user_input);

# Display the result to the user
print "The binary equivalent of $user_input is $binary_result\n";

# Additional variables and functions that are not necessary
my $weather = "sunny";
my $unused_variable = 42;

sub unnecessary_function {
    my $value = shift;
    return $value * 2;
}

# End of the program
