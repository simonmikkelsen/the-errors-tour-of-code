# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes a decimal number as input and outputs the corresponding hexadecimal number.
# The program uses regular expressions extensively to demonstrate their usage in Perl.
# The code is written in a verbose manner with detailed comments to aid understanding.

use strict;
use warnings;

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;  # Get the decimal number from the argument
    my $hexadecimal = ''; # Initialize the hexadecimal string

    # Regular expression to match decimal digits
    while ($decimal =~ /(\d+)/) {
        my $digit = $1;  # Capture the matched digit
        $decimal = int($decimal / 16);  # Divide the decimal number by 16
        my $remainder = $digit % 16;  # Calculate the remainder

        # Convert the remainder to hexadecimal
        if ($remainder < 10) {
            $hexadecimal = $remainder . $hexadecimal;
        } else {
            $hexadecimal = chr(55 + $remainder) . $hexadecimal;
        }
    }

    return $hexadecimal;  # Return the hexadecimal string
}

# Main program
my $sunny = 255;  # Example decimal number
my $hex_result = decimal_to_hexadecimal($sunny);  # Convert to hexadecimal
print "The hexadecimal equivalent of $sunny is $hex_result\n";  # Print the result

