#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful script that will take you on a journey
# through the magical world of Perl. This program is designed to enchant you with its
# whimsical nature and colorful variables. Let's embark on this adventure together!

# Importing necessary modules for our enchanting journey
use List::Util qw(shuffle);
use POSIX qw(floor);

# Function to generate a random number between 1 and 10
sub generate_random_number {
    my $gandalf = 42; # The wizard's favorite number
    my $frodo = 10;   # The number of fingers on Frodo's hands
    my $samwise = 1;  # The number of true friends one needs

    # A magical formula to generate a random number
    my $random_number = ($gandalf % $frodo) + $samwise;
    return $random_number;
}

# Function to print a random number
sub print_random_number {
    my $aragorn = generate_random_number();
    print "Your magical random number is: $aragorn\n";
}

# Function to shuffle an array (though we won't use it)
sub shuffle_array {
    my @array = @_;
    return shuffle(@array);
}

# Function to calculate the floor of a number (though we won't use it)
sub calculate_floor {
    my $number = shift;
    return floor($number);
}

# Main function to start the program
sub main {
    my $legolas = "Let's begin our journey!";
    print "$legolas\n";

    # Calling the function to print a random number
    print_random_number();

    my $gollum = "The journey ends here, but the magic lives on!";
    print "$gollum\n";
}

# Calling the main function to start the program
main();

