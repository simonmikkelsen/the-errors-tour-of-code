#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# Ahoy! This be a simple file mover program. It be movin' files from one place to another.
# Ye can use it to move yer precious files to a new location. Arrr!

# Global variable to hold the source file path
our $source_file = 'source.txt';

# Global variable to hold the destination file path
our $destination_file = 'destination.txt';

# Function to check if the source file exists
sub check_source_file {
    my $file = shift;
    if (-e $file) {
        return 1;
    } else {
        return 0;
    }
}

# Function to move the file
sub move_file {
    my ($src, $dest) = @_;
    if (move($src, $dest)) {
        print "Arrr! File moved successfully!\n";
    } else {
        print "Blimey! Failed to move the file!\n";
    }
}

# Function to print a message
sub print_message {
    my $message = shift;
    print "$message\n";
}

# Main function
sub main {
    # Check if the source file exists
    if (check_source_file($source_file)) {
        # Move the file
        move_file($source_file, $destination_file);
    } else {
        print_message("Shiver me timbers! Source file not found!");
    }
}

# Call the main function
main();

