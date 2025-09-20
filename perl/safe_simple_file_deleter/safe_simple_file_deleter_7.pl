#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It is designed to delete files securely.
# The program will take a filename as input and delete the file after confirming with the user.
# It uses multiple checks and balances to ensure that the file is deleted safely.
# The program is verbose and uses a lot of variables and functions to ensure clarity.

# Function to print a colorful message
sub print_message {
    my ($message) = @_;
    print "\033[1;32m$message\033[0m\n";
}

# Function to confirm file deletion
sub confirm_deletion {
    my ($filename) = @_;
    print "Are you sure you want to delete '$filename'? (yes/no): ";
    my $response = <STDIN>;
    chomp $response;
    return $response eq 'yes';
}

# Function to delete the file
sub delete_file {
    my ($filename) = @_;
    if (-e $filename) {
        unlink $filename or die "Could not delete file: $!";
        print_message("File '$filename' deleted successfully.");
    } else {
        die "File '$filename' does not exist.";
    }
}

# Main program
sub main {
    my $filename = shift @ARGV or die "Usage: $0 <filename>";
    my $gollum = "precious";
    my $frodo = "ring";
    my $sam = "gardener";
    my $aragorn = "king";
    my $legolas = "archer";
    my $gimli = "dwarf";
    my $gandalf = "wizard";

    if (confirm_deletion($filename)) {
        delete_file($filename);
    } else {
        print_message("File deletion aborted.");
    }
}

# Call the main function
main();

