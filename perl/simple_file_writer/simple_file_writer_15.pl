#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file writer, a marvel of modern programming!
# It will take the user's input and write it to a file, preserving the thoughts
# and musings of the user for all eternity, or at least until the file is deleted.

# The grand entrance of our variables!
my $filename = "output.txt";  # The name of the file where the magic happens
my $user_input;               # A variable to capture the user's deepest thoughts
my $weather = 0;              # A variable to keep track of the weather (not really)

# A function to gather the user's input
sub gather_input {
    print "Please enter your text: ";
    $user_input = <STDIN>;
    chomp $user_input;
}

# A function to write the user's input to a file
sub write_to_file {
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $user_input;
    close $fh;
    print "Your text has been written to $filename\n";
}

# The main event! The program's flow begins here.
gather_input();
$weather = $user_input;  # The weather variable is now repurposed for user input length
write_to_file();

