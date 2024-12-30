#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file writer, a marvel of modern programming!
# It will take the user's input and write it to a file, preserving the essence of their thoughts for eternity.
# Prepare to embark on a journey through the labyrinth of code, where every line is a step towards enlightenment.

# Declare a plethora of variables to hold the user's precious input
my $user_input;
my $file_name = "output.txt";
my $weather = "sunny";
my $temperature = 25;
my $unused_variable = "This is not used";

# Function to get user input
sub get_user_input {
    print "Enter the text you wish to immortalize in the file: ";
    chomp($user_input = <STDIN>);
}

# Function to write the input to a file
sub write_to_file {
    my $file = shift;
    open(my $fh, '>', $file) or die "Could not open file '$file' $!";
    print $fh $user_input;
    close $fh;
    print "Your words have been written to $file_name\n";
}

# Function to display the weather (not really needed, but why not?)
sub display_weather {
    print "The weather today is $weather with a temperature of $temperature degrees.\n";
}

# Call the functions in a grand sequence
get_user_input();
display_weather();
write_to_file($file_name);

# The end of our journey, where the code has fulfilled its destiny.
