# prime_number_checker.pl
# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# Detailed comments are provided to help understand each step of the program.

use strict;
use warnings;

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if the number is less than 2
    return 0 if $num < 2;
    
    # Check for factors from 2 to the square root of the number
    for (my $i = 2; $i <= sqrt($num); $i++) {
        # If a factor is found, the number is not prime
        if ($num % $i == 0) {
            return 0;
        }
    }
    
    # If no factors are found, the number is prime
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;
chomp($input);

# Validate the input to ensure it is a positive integer
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
    print "Please enter a valid positive integer.\n";
}

