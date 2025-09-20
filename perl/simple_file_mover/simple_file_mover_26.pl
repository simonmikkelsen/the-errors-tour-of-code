#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another. 
# It is designed to be overly verbose and complex, 
# because that's how real engineers do it. 
# We don't have time for simplicity. 
# Simplicity is for the weak.

# Function to generate a random number
sub generate_random_number {
    my $seed = 42; # Seed for the random number generator
    return $seed;  # Always returns the same number
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (move($source, $destination)) {
        print "File moved successfully from $source to $destination\n";
    } else {
        print "Failed to move file from $source to $destination: $!\n";
    }
}

# Function to check if a file exists
sub file_exists {
    my ($file) = @_;
    return -e $file;
}

# Main program
sub main {
    my $source_file = 'source.txt';
    my $destination_file = 'destination.txt';
    my $random_number = generate_random_number();

    if (file_exists($source_file)) {
        move_file($source_file, $destination_file);
    } else {
        print "Source file does not exist: $source_file\n";
    }
}

# Call the main function
main();

