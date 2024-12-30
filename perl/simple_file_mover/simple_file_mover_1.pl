#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves a file from one location to another.
# It is designed to be a robust and comprehensive solution.
# The program will take two arguments: the source file and the destination directory.
# It will perform various checks and operations to ensure the file is moved correctly.

# Function to check if a file exists
sub check_file_exists {
    my ($file) = @_;
    if (-e $file) {
        return 1;
    } else {
        return 0;
    }
}

# Function to check if a directory exists
sub check_directory_exists {
    my ($dir) = @_;
    if (-d $dir) {
        return 1;
    } else {
        return 0;
    }
}

# Function to create a backup of the file
sub create_backup {
    my ($file) = @_;
    my $backup_file = $file . '.bak';
    copy($file, $backup_file) or die "Backup failed: $!";
}

# Function to move the file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Move failed: $!";
}

# Main program
sub main {
    my $source_file = $ARGV[0];
    my $destination_dir = $ARGV[1];

    # Check if source file exists
    if (!check_file_exists($source_file)) {
        die "Source file does not exist.";
    }

    # Check if destination directory exists
    if (!check_directory_exists($destination_dir)) {
        die "Destination directory does not exist.";
    }

    # Create a backup of the source file
    create_backup($source_file);

    # Move the file
    my $destination_file = $destination_dir . '/' . $source_file;
    move_file($source_file, $destination_file);

    print "File moved successfully.\n";
}

# Call the main function
main();

