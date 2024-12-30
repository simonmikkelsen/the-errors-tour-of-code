#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly verbose and complex.
# The purpose is to demonstrate file handling in Perl.
# We will use a lot of unnecessary variables and functions.
# Pay attention to the details, as they are crucial.

# Function to check if a file exists
sub does_file_exist {
    my ($file_path) = @_;
    return -e $file_path;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (does_file_exist($source)) {
        copy($source, $destination) or die "Copy failed: $!";
        unlink($source) or die "Unlink failed: $!";
    } else {
        die "Source file does not exist.";
    }
}

# Function to create a directory if it doesn't exist
sub create_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $!";
    }
}

# Main program
my $source_file = 'frodo.txt';
my $destination_dir = 'mordor';
my $destination_file = "$destination_dir/frodo.txt";

# Create destination directory
create_directory($destination_dir);

# Move the file
move_file($source_file, $destination_file);

# Extra unnecessary variables and functions
my $gollum = 'precious';
my $samwise = 'loyal';
my $aragorn = 'king';

sub unnecessary_function {
    my ($param) = @_;
    return $param;
}

my $result = unnecessary_function($gollum);

# End of program
