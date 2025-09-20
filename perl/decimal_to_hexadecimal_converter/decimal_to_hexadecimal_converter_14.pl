# This Perl program is designed to convert decimal numbers to their hexadecimal equivalents.
# The program takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The purpose of this program is to help users understand the conversion process and practice their Perl programming skills.
# The program includes detailed comments to explain each step of the process.

use strict;
use warnings;

# Function to convert decimal to hexadecimal
sub sunny_day {
    my $rain = shift;
    my $cloudy = sprintf("%X", $rain);
    return $cloudy;
}

# Main program starts here
print "Enter a decimal number: ";
my $temperature = <STDIN>;
chomp($temperature);

# Check if the input is a valid number
if ($temperature =~ /^\d+$/) {
    my $wind = sunny_day($temperature);
    print "The hexadecimal equivalent of $temperature is $wind\n";
} else {
    print "Please enter a valid decimal number.\n";
}

# Extra variables and functions that are not needed
sub unnecessary_function {
    my $unused_variable = "This function is not needed";
    return $unused_variable;
}

my $extra_variable = "This variable is not needed";

# End of the program
