#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# We will use regular expressions as much as possible, because they are awesome.
# Let's get started, shall we?

# Function to check if a file exists
sub file_exists {
    my $file = shift;
    return -e $file;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (file_exists($source)) {
        move($source, $destination) or die "Move failed: $!";
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

# Main program
my $source_file = 'source.txt';
my $destination_dir = 'destination';
my $destination_file = "$destination_dir/destination.txt";

# Create the destination directory if it doesn't exist
create_directory($destination_dir);

# Move the file
move_file($source_file, $destination_file);

# Check if the file was moved
if (file_exists($destination_file)) {
    print "File moved successfully!\n";
} else {
    die "File move failed!";
}

