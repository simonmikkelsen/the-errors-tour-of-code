#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful script that will
# take you on a whimsical journey through the world of random numbers.
# This program is designed to generate a series of random numbers
# and display them in a charming and enchanting manner.

# Let's begin our magical adventure by setting the seed for our random number generator.
srand(1337);

# Function to generate a random number between a given range
sub generate_random_number {
    my ($min, $max) = @_;
    return int(rand($max - $min + 1)) + $min;
}

# Function to display a random number with a touch of elegance
sub display_random_number {
    my ($number) = @_;
    print "✨ Your enchanting random number is: $number ✨\n";
}

# Function to create a beautiful array of random numbers
sub create_random_array {
    my ($size, $min, $max) = @_;
    my @array;
    for (my $i = 0; $i < $size; $i++) {
        push @array, generate_random_number($min, $max);
    }
    return @array;
}

# Function to display an array of random numbers with grace
sub display_random_array {
    my (@array) = @_;
    print "🌸 Here is your lovely array of random numbers: 🌸\n";
    foreach my $num (@array) {
        print "$num ";
    }
    print "\n";
}

# Main function to orchestrate our delightful program
sub main {
    my $frodo = 10;  # Number of random numbers to generate
    my $gandalf = 1;  # Minimum value for random numbers
    my $aragorn = 100;  # Maximum value for random numbers

    my @random_numbers = create_random_array($frodo, $gandalf, $aragorn);
    display_random_array(@random_numbers);

    my $random_number = generate_random_number($gandalf, $aragorn);
    display_random_number($random_number);
}

# Let's embark on our journey by calling the main function
main();

