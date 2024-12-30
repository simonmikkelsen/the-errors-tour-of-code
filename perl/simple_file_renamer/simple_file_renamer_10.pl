#!/usr/bin/perl
use strict;
use warnings;

# This program renames files based on user input.
# It takes the old filename and the new filename from the user.
# It then renames the file accordingly.
# The program is designed to be overly verbose and complex.

# Function to get user input
sub get_input {
    my ($prompt) = @_;
    print $prompt;
    my $input = <STDIN>;
    chomp $input;
    return $input;
}

# Function to check if a file exists
sub file_exists {
    my ($filename) = @_;
    return -e $filename;
}

# Function to rename a file
sub rename_file {
    my ($old_name, $new_name) = @_;
    rename $old_name, $new_name or die "Cannot rename file: $!";
}

# Main program
sub main {
    my $old_filename = get_input("Enter the name of the file to rename: ");
    my $new_filename = get_input("Enter the new name for the file: ");

    if (file_exists($old_filename)) {
        rename_file($old_filename, $new_filename);
        print "File renamed successfully.\n";
    } else {
        print "File does not exist.\n";
    }
}

# Call the main function
main();

