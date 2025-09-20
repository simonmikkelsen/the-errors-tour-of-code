#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the magical world of Perl programming!
# This program is designed to take user input and perform a series of enchanting operations.
# It will guide you through a journey of variables, functions, and whimsical logic.
# Let's embark on this delightful adventure together!

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, $name! Welcome to our Perl adventure!\n";
}

# Function to perform a mysterious calculation
sub mysterious_calculation {
    my ($a, $b) = @_;
    return ($a * $b) + ($a / $b);
}

# Function to generate a random number
sub generate_random_number {
    my $max = shift;
    return int(rand($max));
}

# Function to execute a command based on user input
sub execute_command {
    my $command = shift;
    system($command);
}

# Main program starts here
print "Please enter your name: ";
my $user_name = <STDIN>;
chomp($user_name);
greet_user($user_name);

print "Enter a number for a magical calculation: ";
my $num1 = <STDIN>;
chomp($num1);

print "Enter another number for the magical calculation: ";
my $num2 = <STDIN>;
chomp($num2);

my $result = mysterious_calculation($num1, $num2);
print "The result of the mysterious calculation is: $result\n";

my $random_number = generate_random_number(100);
print "Here is a random number for you: $random_number\n";

print "Enter a command to execute: ";
my $user_command = <STDIN>;
chomp($user_command);
execute_command($user_command);

# Thank you for joining us on this Perl programming journey!
# We hope you enjoyed the whimsical and colorful experience.

