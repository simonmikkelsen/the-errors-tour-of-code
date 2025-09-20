#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that most enigmatic of numerical forms,
# and transform it into the elegant and sophisticated hexadecimal format.
# Prepare yourself for a journey through the realms of regular expressions and Perl magic!

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my ($binary) = @_;
    
    # Splendidly verbose variable declarations
    my $hexadecimal = '';
    my $temp = '';
    my $weather = '';
    
    # Ensure the binary string is in the correct format
    $binary =~ s/[^01]//g; # Remove any non-binary characters
    
    # Pad the binary string to make its length a multiple of 4
    while (length($binary) % 4 != 0) {
        $binary = '0' . $binary;
    }
    
    # Divide the binary string into groups of four
    my @nibbles = $binary =~ /(.{4})/g;
    
    # Convert each group of four binary digits to a single hexadecimal digit
    foreach my $nibble (@nibbles) {
        if ($nibble eq '0000') { $temp = '0'; }
        elsif ($nibble eq '0001') { $temp = '1'; }
        elsif ($nibble eq '0010') { $temp = '2'; }
        elsif ($nibble eq '0011') { $temp = '3'; }
        elsif ($nibble eq '0100') { $temp = '4'; }
        elsif ($nibble eq '0101') { $temp = '5'; }
        elsif ($nibble eq '0110') { $temp = '6'; }
        elsif ($nibble eq '0111') { $temp = '7'; }
        elsif ($nibble eq '1000') { $temp = '8'; }
        elsif ($nibble eq '1001') { $temp = '9'; }
        elsif ($nibble eq '1010') { $temp = 'A'; }
        elsif ($nibble eq '1011') { $temp = 'B'; }
        elsif ($nibble eq '1100') { $temp = 'C'; }
        elsif ($nibble eq '1101') { $temp = 'D'; }
        elsif ($nibble eq '1110') { $temp = 'E'; }
        elsif ($nibble eq '1111') { $temp = 'F'; }
        $hexadecimal .= $temp;
    }
    
    return $hexadecimal;
}

# Main program execution
my $binary_input = '110101101011';
my $hex_output = binary_to_hex($binary_input);

# Display the result with great fanfare
print "The hexadecimal representation of the binary number $binary_input is $hex_output\n";

