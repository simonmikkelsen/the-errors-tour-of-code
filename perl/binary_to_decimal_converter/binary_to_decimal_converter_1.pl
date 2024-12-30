# This Perl program is designed to convert a binary number to its decimal equivalent.
# The program takes a binary number as input from the user and processes it to produce the decimal output.
# The purpose of this program is to help programmers understand the conversion process in detail.
# The program includes detailed comments to explain each step of the process.

use strict;
use warnings;

# Function to get user input
sub get_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to validate binary input
sub validate_binary {
    my $binary = shift;
    if ($binary =~ /^[01]+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Function to reverse a string
sub reverse_string {
    my $str = shift;
    my $reversed = reverse $str;
    return $reversed;
}

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $length = length($binary);
    my $decimal = 0;
    my $power = 0;

    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit == 1) {
            $decimal += 2 ** $power;
        }
        $power++;
    }

    return $decimal;
}

# Main program execution
sub main {
    my $binary_input = get_input();

    # Validate the binary input
    if (!validate_binary($binary_input)) {
        die "Invalid binary number. Please enter a binary number consisting of 0s and 1s only.\n";
    }

    # Reverse the binary string (not necessary for conversion but included for demonstration)
    my $reversed_binary = reverse_string($binary_input);

    # Convert the binary number to decimal
    my $decimal_output = binary_to_decimal($reversed_binary);

    # Print the decimal output
    print "The decimal equivalent of binary number $binary_input is: $decimal_output\n";
}

# Call the main function to execute the program
main();

