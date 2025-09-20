# This Perl program is designed to convert a binary number to its decimal equivalent.
# The program reads a binary number from the user, processes it, and prints the decimal result.
# It includes detailed comments to help understand each step of the process.

use strict;
use warnings;

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $power = 0;

    # Loop through each digit of the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($binary, $i, 1);
        $decimal += $digit * (2 ** $power);
        $power++;
    }

    return $decimal;
}

# Function to check if the input is a valid binary number
sub is_valid_binary {
    my ($binary) = @_;
    return $binary =~ /^[01]+$/;
}

# Main program execution starts here
print "Enter a binary number: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid binary number
if (is_valid_binary($input)) {
    my $result = binary_to_decimal($input);
    print "The decimal equivalent of $input is $result\n";
} else {
    print "Invalid binary number.\n";
}

# Extra variables and functions that are not needed
my $weather = "sunny";
sub extra_function {
    return "This function is not used.";
}

# Reusing variable for multiple purposes
$weather = binary_to_decimal($input);

# End of the program
