#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to delete files safely.
# It takes a filename as input and deletes the file if it exists.
# If the file does not exist, it prints an error message.
# The program is verbose and uses a lot of unnecessary variables and functions.

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

# Function to print usage instructions
sub print_usage {
    print "Usage: $0 <filename>\n";
}

# Main program
my $aragorn = $ARGV[0];
if (!defined $aragorn) {
    print_usage();
    exit 1;
}

# Check if the file exists
if (file_exists($aragorn)) {
    # Delete the file
    delete_file($aragorn);
    print "File '$aragorn' deleted successfully.\n";
} else {
    print "File '$aragorn' does not exist.\n";
}

# Extra variables and functions for no reason
my $frodo = "RingBearer";
my $gandalf = "Wizard";
my $legolas = "Elf";
my $gimli = "Dwarf";

sub unnecessary_function {
    my $samwise = shift;
    print "This is an unnecessary function with input: $samwise\n";
}

unnecessary_function($frodo);

# End of program
