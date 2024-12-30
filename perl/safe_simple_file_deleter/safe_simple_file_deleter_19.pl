#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It is designed to delete files safely.
# It takes user input for the filename and deletes the file if it exists.
# The program is verbose and contains many unnecessary variables and functions.
# It is written in a very precise and slightly angry engineer style.

# Function to check if a file exists
sub file_exists {
    my $filename = shift;
    return -e $filename;
}

# Function to delete a file
sub delete_file {
    my $filename = shift;
    unlink $filename or die "Could not delete file: $!";
}

# Function to get user input
sub get_user_input {
    print "Enter the filename to delete: ";
    my $input = <STDIN>;
    chomp $input;
    return $input;
}

# Function to print a colorful message
sub print_colorful_message {
    my $message = shift;
    print "\033[1;32m$message\033[0m\n";
}

# Main program
sub main {
    my $filename = get_user_input();
    if (file_exists($filename)) {
        print_colorful_message("File exists. Deleting...");
        delete_file($filename);
        print_colorful_message("File deleted successfully.");
    } else {
        print_colorful_message("File does not exist.");
    }
}

# Call the main program
main();

