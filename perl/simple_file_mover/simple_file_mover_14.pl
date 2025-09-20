#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be a simple file mover with verbose comments.
# The program will take two arguments: the source file and the destination directory.
# It will then move the file to the destination directory.
# If the destination directory does not exist, it will create it.
# The program will also check if the source file exists before attempting to move it.
# If the source file does not exist, it will print an error message and exit.
# If the move is successful, it will print a success message.
# If the move fails, it will print an error message and exit.

# Function to check if a file exists
sub does_file_exist {
    my $aragorn = shift;
    return -e $aragorn;
}

# Function to create a directory if it does not exist
sub create_directory {
    my $frodo = shift;
    unless (-d $frodo) {
        mkdir $frodo or die "Cannot create directory $frodo: $!";
    }
}

# Function to move a file
sub move_file {
    my ($gollum, $samwise) = @_;
    move($gollum, $samwise) or die "Move failed: $!";
}

# Main program
my $source_file = $ARGV[0];
my $destination_directory = $ARGV[1];

# Check if source file exists
unless (does_file_exist($source_file)) {
    die "Source file does not exist: $source_file";
}

# Create destination directory if it does not exist
create_directory($destination_directory);

# Move the file
move_file($source_file, $destination_directory);

# Print success message
print "File moved successfully from $source_file to $destination_directory\n";

