# This Perl program is designed to check if a given number is a prime number.
# It takes a single input from the user and determines if the number is prime.
# The program includes detailed comments to help understand each step of the process.

use strict;
use warnings;

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;

    # Return false if the number is less than 2
    return 0 if $num < 2;

    # Check divisibility from 2 to the square root of the number
    for my $i (2 .. sqrt($num)) {
        # If the number is divisible by any number other than 1 and itself, it is not prime
        return 0 if $num % $i == 0;
    }

    # If no divisors were found, the number is prime
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    # Call the is_prime function and store the result
    my $result = is_prime($input);

    # Print the result
    if ($result) {
        print "$input is a prime number.\n";
    } else {
        print "$input is not a prime number.\n";
    }
} else {
    # If the input is not a valid number, print an error message
    print "Invalid input. Please enter a valid number.\n";
}

