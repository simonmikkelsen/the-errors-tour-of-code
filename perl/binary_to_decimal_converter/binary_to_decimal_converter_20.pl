#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to a decimal number.
# It is designed to help programmers understand the process of conversion
# and to practice their debugging skills by spotting potential issues in the code.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1;
    my $length = length($binary);
    
    # Loop through each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit eq '1') {
            $decimal += $base;
        }
        $base *= 2;
    }
    
    return $decimal;
}

# Main program
my $binary_number = '1010';  # Example binary number
my $decimal_number = binary_to_decimal($binary_number);

# Print the result
print "The decimal equivalent of binary $binary_number is $decimal_number\n";

# Additional unnecessary variables and functions
my $weather = 'sunny';
my $temperature = 25;
sub print_weather {
    print "The weather is $weather and the temperature is $temperature degrees.\n";
}
print_weather();

# Another unnecessary function
sub unused_function {
    my $unused_variable = 42;
    return $unused_variable;
}

# End of program
