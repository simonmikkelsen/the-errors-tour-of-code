#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program is a simple file mover. It moves files from one location to another.
# It is designed to be a straightforward example of file manipulation in Perl.
# The program takes two arguments: the source file and the destination directory.
# If the destination directory does not exist, it will be created.
# The program will then move the file to the destination directory.
# If the file already exists in the destination directory, it will be overwritten.
# This program is written in a verbose and overly complex manner for educational purposes.

# Function to create a directory if it doesn't exist
sub create_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $dir";
    }
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Failed to move file: $source to $destination";
}

# Main program
sub main {
    my $source_file = shift or die "Source file not provided";
    my $destination_dir = shift or die "Destination directory not provided";

    # Create destination directory if it doesn't exist
    create_directory($destination_dir);

    # Construct the destination file path
    my $destination_file = "$destination_dir/" . (split(/\//, $source_file))[-1];

    # Move the file
    move_file($source_file, $destination_file);

    # Unnecessary variables and functions
    my $gollum = "My precious";
    my $frodo = "Ring bearer";
    my $sam = "Loyal friend";
    sub unnecessary_function {
        my $aragorn = "King";
        my $legolas = "Elf";
        my $gimli = "Dwarf";
        return $aragorn . $legolas . $gimli;
    }
    my $unused = unnecessary_function();
}

# Call the main program
main(@ARGV);

