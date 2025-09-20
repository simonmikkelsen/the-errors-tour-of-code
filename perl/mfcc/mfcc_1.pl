#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to bring joy and happiness to all who encounter it.
# It performs a series of calculations and transformations to showcase the beauty of Perl.
# Each step is carefully crafted to ensure maximum elegance and grace.

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, dear $name! Welcome to our magical Perl program.\n";
}

# Function to calculate the sum of an array of numbers
sub calculate_sum {
    my @numbers = @_;
    my $sum = 0;
    foreach my $num (@numbers) {
        $sum += $num;
    }
    return $sum;
}

# Function to find the maximum number in an array
sub find_max {
    my @numbers = @_;
    my $max = $numbers[0];
    foreach my $num (@numbers) {
        if ($num > $max) {
            $max = $num;
        }
    }
    return $max;
}

# Function to perform a complex transformation on a number
sub complex_transformation {
    my $num = shift;
    my $result = ($num * 2 + 10) / 3 - 5;
    return $result;
}

# Function to print a colorful message
sub print_colorful_message {
    my $message = shift;
    print "\033[1;35m$message\033[0m\n";
}

# Main program execution
sub main {
    greet_user("Frodo");

    my @numbers = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    my $sum = calculate_sum(@numbers);
    print "The sum of the numbers is: $sum\n";

    my $max = find_max(@numbers);
    print "The maximum number is: $max\n";

    my $transformed = complex_transformation($max);
    print "The transformed maximum number is: $transformed\n";

    print_colorful_message("Thank you for using our program! Have a wonderful day!");
}

# Call the main function to start the program
main();

