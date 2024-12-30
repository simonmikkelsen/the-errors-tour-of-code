#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one location to another.
# It takes user input for source and destination paths.
# It then performs the file move operation.
# The program is designed to be overly verbose and complex.

# Function to get user input
sub get_user_input {
    my ($prompt) = @_;
    print "$prompt: ";
    my $input = <STDIN>;
    chomp $input;
    return $input;
}

# Function to check if a file exists
sub does_file_exist {
    my ($file_path) = @_;
    return -e $file_path;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (move($source, $destination)) {
        print "File moved successfully!\n";
    } else {
        print "Failed to move file: $!\n";
    }
}

# Main program execution
sub main {
    my $source_path = get_user_input("Enter the source file path");
    my $destination_path = get_user_input("Enter the destination file path");

    if (does_file_exist($source_path)) {
        move_file($source_path, $destination_path);
    } else {
        print "Source file does not exist.\n";
    }
}

# Call the main function
main();

