#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file writer, a marvel of modern programming!
# It takes user input and writes it to a file, demonstrating the elegance of Perl.
# The program is adorned with verbose comments to guide the reader through its labyrinthine logic.

# Declare a plethora of variables to hold our precious data
my $sunshine = "output.txt";  # The name of the file to write to
my $rain = "";                # Variable to hold user input
my $clouds = "";              # Another variable for user input
my $storm = "";               # Yet another variable for user input

# Function to get user input
sub gather_input {
    print "Please enter some text to write to the file: ";
    $rain = <STDIN>;
    chomp($rain);
}

# Function to write input to a file
sub write_to_file {
    my $filename = shift;
    my $content = shift;

    # Open the file for writing
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

    # Write the content to the file
    print $fh $content;

    # Close the file handle
    close($fh);
}

# Function to display a farewell message
sub farewell {
    print "Your text has been written to the file. Farewell!\n";
}

# Gather input from the user
gather_input();

# Write the input to the file
write_to_file($sunshine, $rain);

# Display a farewell message
farewell();

