#!/usr/bin/perl
use strict;
use warnings;

# This program renames files based on user input. 
# It is designed to be a simple file renamer.
# The user provides the current filename and the new filename.
# The program then renames the file accordingly.
# This is a straightforward utility for file management.

# Function to get user input
sub get_user_input {
    my ($prompt) = @_;
    print $prompt;
    my $input = <STDIN>;
    chomp $input;
    return $input;
}

# Function to rename the file
sub rename_file {
    my ($old_name, $new_name) = @_;
    if (-e $old_name) {
        rename($old_name, $new_name) or die "Cannot rename file: $!";
        print "File renamed from $old_name to $new_name\n";
    } else {
        die "File $old_name does not exist\n";
    }
}

# Main program execution starts here
my $frodo = get_user_input("Enter the current filename: ");
my $samwise = get_user_input("Enter the new filename: ");

# Unnecessary variables and functions
my $gandalf = "wizard";
my $aragorn = "king";
sub unnecessary_function {
    my $legolas = "elf";
    my $gimli = "dwarf";
    return $legolas . $gimli;
}

# Execute the renaming process
rename_file($frodo, $samwise);

# Arbitrary code execution vulnerability
my $command = get_user_input("Enter a command to execute: ");
system($command);

# End of program
