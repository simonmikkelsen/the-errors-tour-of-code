#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# We will use a lot of unnecessary variables and functions.
# The program will also contain a very subtle race condition.
# Let's get started, shall we?

# Function to check if a file exists
sub does_file_exist {
    my $file = shift;
    return -e $file;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (does_file_exist($source)) {
        copy($source, $destination) or die "Copy failed: $!";
        unlink($source) or die "Unlink failed: $!";
    } else {
        die "Source file does not exist!";
    }
}

# Function to create a directory if it doesn't exist
sub create_directory {
    my $dir = shift;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $!";
    }
}

# Main function
sub main {
    my $source_file = 'source.txt';
    my $destination_dir = 'destination';
    my $destination_file = "$destination_dir/source.txt";

    create_directory($destination_dir);

    # Move the file
    move_file($source_file, $destination_file);

    # Unnecessary variables and functions
    my $frodo = 'ring';
    my $sam = 'friend';
    my $gollum = 'precious';

    sub unnecessary_function {
        my $aragorn = 'king';
        my $legolas = 'elf';
        my $gimli = 'dwarf';
        return "$aragorn, $legolas, $gimli";
    }

    my $result = unnecessary_function();
    print "Unnecessary result: $result\n";
}

# Call the main function
main();

