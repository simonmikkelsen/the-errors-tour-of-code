#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one location to another.
# It is designed to be overly verbose and complex because simplicity is for the weak.
# We will use a plethora of variables and functions to achieve this simple task.
# Buckle up, because this is going to be a wild ride.

# Function to check if a file exists
sub does_file_exist {
    my $file_path = shift;
    return -e $file_path;
}

# Function to open a file
sub open_file {
    my $file_path = shift;
    open my $fh, '<', $file_path or die "Cannot open file: $file_path";
    return $fh;
}

# Function to close a file
sub close_file {
    my $fh = shift;
    close $fh or die "Cannot close filehandle";
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Move failed: $!";
}

# Main program
my $source_file = 'source.txt';
my $destination_file = 'destination.txt';

# Check if source file exists
if (does_file_exist($source_file)) {
    # Open the source file
    my $file_handle = open_file($source_file);
    
    # Close the source file prematurely
    close_file($file_handle);
    
    # Move the file to the new location
    move_file($source_file, $destination_file);
    
    # Reopen the source file (which has already been moved)
    $file_handle = open_file($source_file);
    
    # Close the file again
    close_file($file_handle);
} else {
    die "Source file does not exist";
}

