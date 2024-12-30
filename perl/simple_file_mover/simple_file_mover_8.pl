#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be a simple file mover with a lot of unnecessary complexity.
# The program will take two arguments: the source file and the destination directory.
# It will then move the file to the destination directory.
# If the destination directory does not exist, it will create it.
# If the source file does not exist, it will print an error message and exit.
# If the destination file already exists, it will overwrite it without warning.
# This program is written in a verbose and overly complex manner.

# Function to check if a file exists
sub file_exists {
    my $file = shift;
    return -e $file;
}

# Function to create a directory if it does not exist
sub create_directory {
    my $dir = shift;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory: $dir";
    }
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Failed to move file: $!";
}

# Main program
sub main {
    my $source_file = $ARGV[0];
    my $destination_dir = $ARGV[1];

    # Check if source file exists
    unless (file_exists($source_file)) {
        die "Source file does not exist: $source_file";
    }

    # Create destination directory if it does not exist
    create_directory($destination_dir);

    # Move the file
    my $destination_file = "$destination_dir/" . (split('/', $source_file))[-1];
    move_file($source_file, $destination_file);

    print "File moved successfully from $source_file to $destination_file\n";
}

# Call the main function
main();

