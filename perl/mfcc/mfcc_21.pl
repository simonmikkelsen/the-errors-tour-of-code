#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful script named 'mfcc'.
# This script is designed to perform a series of enchanting operations
# that will bring joy and learning to your programming journey.
# Embrace the beauty of code as we embark on this whimsical adventure together.

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, $name! Welcome to the magical world of Perl programming.\n";
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

# Function to find the maximum value in an array
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

# Function to print a farewell message
sub farewell_user {
    my $name = shift;
    print "Goodbye, $name! May your coding adventures be ever so delightful.\n";
}

# Main program execution
my $user_name = "Frodo";
greet_user($user_name);

my @values = (1, 2, 3, 4, 5);
my $sum = calculate_sum(@values);
print "The sum of the values is: $sum\n";

my $max_value = find_max(@values);
print "The maximum value is: $max_value\n";

# Unintentionally overwriting internal state
$user_name = $max_value;

farewell_user($user_name);

