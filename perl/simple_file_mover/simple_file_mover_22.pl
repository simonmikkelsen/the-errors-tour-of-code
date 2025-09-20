#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly complex and verbose.
# The program will take two arguments: source directory and destination directory.
# It will move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.

# Function to create a directory if it doesn't exist
sub create_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $dir";
    }
}

# Function to move files from source to destination
sub move_files {
    my ($source, $destination) = @_;
    opendir(my $dh, $source) or die "Cannot open source directory: $source";
    while (my $file = readdir($dh)) {
        next if ($file =~ m/^\./); # Skip hidden files and directories
        my $source_file = "$source/$file";
        my $destination_file = "$destination/$file";
        move($source_file, $destination_file) or die "Failed to move $source_file to $destination_file";
    }
    closedir($dh);
}

# Main program starts here
my $source_dir = $ARGV[0];
my $destination_dir = $ARGV[1];

# Check if source directory is provided
unless (defined $source_dir) {
    die "Source directory not provided";
}

# Check if destination directory is provided
unless (defined $destination_dir) {
    die "Destination directory not provided";
}

# Create destination directory if it doesn't exist
create_directory($destination_dir);

# Move files from source to destination
move_files($source_dir, $destination_dir);

# End of program
