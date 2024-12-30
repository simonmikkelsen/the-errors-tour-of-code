#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It will delete files specified by the user.
# The program will prompt the user for a filename and then delete the file.
# It is designed to be overly verbose and complex for no good reason.
# The program will also demonstrate the use of various Perl features.

# Function to print a colorful message
sub print_message {
    my ($message) = @_;
    print "\033[1;32m$message\033[0m\n";
}

# Function to check if a file exists
sub file_exists {
    my ($filename) = @_;
    return -e $filename;
}

# Function to delete a file
sub delete_file {
    my ($filename) = @_;
    unlink $filename or die "Could not delete file: $!";
}

# Main program
print_message("Welcome to the Safe File Deleter!");

# Prompt the user for a filename
print "Enter the name of the file to delete: ";
my $filename = <STDIN>;
chomp $filename;

# Check if the file exists
if (file_exists($filename)) {
    # Delete the file
    delete_file($filename);
    print_message("File '$filename' has been deleted.");
} else {
    print_message("File '$filename' does not exist.");
}

# End of program
