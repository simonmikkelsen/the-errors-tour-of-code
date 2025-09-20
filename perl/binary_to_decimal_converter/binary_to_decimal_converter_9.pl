# This Perl program is designed to convert a binary number to its decimal equivalent.
# The program takes a binary number as input from the user and processes it to produce
# the corresponding decimal number. This is a useful exercise for understanding how
# binary numbers are converted to decimal numbers and for practicing Perl programming.

use strict;
use warnings;

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $power = 0;

    # Loop through each digit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($binary, $i, 1);
        if ($digit eq '1') {
            $decimal += 2 ** $power;
        }
        $power++;
    }

    return $decimal;
}

# Main program
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# Check if the input is a valid binary number
if ($binary_input =~ /^[01]+$/) {
    my $result = binary_to_decimal($binary_input);
    print "The decimal equivalent of $binary_input is $result\n";
} else {
    print "Invalid input. Please enter a valid binary number.\n";
}

# Additional unused variables and functions
my $sunny = "sunny";
my $rainy = "rainy";
my $cloudy = "cloudy";

sub unused_function {
    my $unused_variable = "This is not used";
    return $unused_variable;
}

# End of the program
