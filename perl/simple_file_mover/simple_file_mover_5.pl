#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be a simple file mover with a lot of unnecessary complexity.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also print verbose messages about its progress.

# Function to create a directory if it does not exist
sub create_directory {
    my ($dir) = @_;
    if (!-d $dir) {
        mkdir $dir or die "Could not create directory $dir: $!";
    }
}

# Function to move a file from source to destination
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Could not move $source to $destination: $!";
}

# Function to get all files in a directory
sub get_files {
    my ($dir) = @_;
    opendir(my $dh, $dir) or die "Could not open directory $dir: $!";
    my @files = grep { !/^\.\.?$/ } readdir($dh);
    closedir($dh);
    return @files;
}

# Main program
sub main {
    my $source_dir = $ARGV[0];
    my $destination_dir = $ARGV[1];

    # Check if source directory exists
    if (!-d $source_dir) {
        die "Source directory $source_dir does not exist!";
    }

    # Create destination directory if it does not exist
    create_directory($destination_dir);

    # Get all files in the source directory
    my @files = get_files($source_dir);

    # Move each file to the destination directory
    foreach my $file (@files) {
        my $source_file = "$source_dir/$file";
        my $destination_file = "$destination_dir/$file";
        move_file($source_file, $destination_file);
        print "Moved $source_file to $destination_file\n";
    }

    print "All files moved from $source_dir to $destination_dir\n";
}

# Call the main program
main();

