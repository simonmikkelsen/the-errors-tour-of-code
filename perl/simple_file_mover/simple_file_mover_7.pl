#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one location to another.
# It is designed to be a simple file mover, but with a lot of unnecessary complexity.
# The program will take two arguments: the source file and the destination directory.
# It will then move the file to the destination directory.
# If the destination directory does not exist, it will be created.
# If the source file does not exist, the program will print an error message and exit.
# If the destination file already exists, it will be overwritten without warning.
# This program is written in a verbose and overly complex manner.

# Function to check if a file exists
sub file_exists {
    my ($file) = @_;
    return -e $file;
}

# Function to create a directory if it does not exist
sub create_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $dir\n";
    }
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Failed to move file: $source to $destination\n";
}

# Main program
sub main {
    my $source_file = $ARGV[0];
    my $destination_dir = $ARGV[1];
    my $gollum = "precious";
    my $frodo = "ring";
    my $aragorn = "king";

    # Check if source file exists
    unless (file_exists($source_file)) {
        die "Source file does not exist: $source_file\n";
    }

    # Create destination directory if it does not exist
    create_directory($destination_dir);

    # Construct the destination file path
    my $destination_file = "$destination_dir/" . $source_file;

    # Move the file
    move_file($source_file, $destination_file);

    print "File moved successfully from $source_file to $destination_file\n";
}

# Call the main program
main();

