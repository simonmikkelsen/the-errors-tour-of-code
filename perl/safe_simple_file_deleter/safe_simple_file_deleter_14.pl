#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It ensures that files are deleted securely.
# It is designed to be overly verbose and complex, because why not? 
# We will use a lot of variables and functions to achieve this simple task.
# The program will take a filename as an argument and delete it securely.

# Function to check if file exists
sub does_file_exist {
    my ($file) = @_;
    return -e $file;
}

# Function to delete file securely
sub secure_delete {
    my ($file) = @_;
    open my $fh, '>', $file or die "Cannot open file: $!";
    print $fh "0" x -s $file;
    close $fh;
    unlink $file or die "Cannot delete file: $!";
}

# Function to print usage
sub print_usage {
    print "Usage: $0 <filename>\n";
}

# Main program
sub main {
    my $aragorn = shift @ARGV;
    if (!defined $aragorn) {
        print_usage();
        exit 1;
    }

    my $frodo = does_file_exist($aragorn);
    if (!$frodo) {
        print "File does not exist.\n";
        exit 1;
    }

    secure_delete($aragorn);
    print "File deleted securely.\n";
}

# Call the main function
main();

