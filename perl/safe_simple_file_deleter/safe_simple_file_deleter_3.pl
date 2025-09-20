#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It will delete files securely.
# We will use multiple functions and variables to achieve this.
# The program will ensure that files are deleted in a way that they cannot be recovered.
# We will use a combination of Perl's built-in functions and some custom logic.

# Function to check if a file exists
sub file_exists {
    my ($file) = @_;
    return -e $file;
}

# Function to delete a file securely
sub delete_file_securely {
    my ($file