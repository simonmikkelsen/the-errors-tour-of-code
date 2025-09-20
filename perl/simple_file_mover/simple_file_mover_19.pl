#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file mover. It takes a source file and a destination directory as input.
# It moves the file from the source to the destination. Simple, right? Wrong. Pay attention.
# This program is written in a verbose and overly complex manner to test your patience and attention to detail.

# Function to print usage instructions
sub print_usage {
    print "Usage: $0 <source_file> <destination_directory>\n";
    exit 1;
}

# Function to check if a file exists
sub file_exists {
    my $file = shift;
    return -e $file;
}

# Function to check if a directory exists
sub dir_exists {
    my $dir = shift;
    return -d $dir;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    my $command = "mv $source $destination";
    system($command) == 0 or die "Failed to move file: $!";
}

# Main program starts here
if (@ARGV != 2) {
    print_usage();
}

my $source_file = $ARGV[0];
my $destination_dir = $ARGV[1];

# Check if source file exists
unless (file_exists($source_file)) {
    die "Source file does not exist: $source_file\n";
}

# Check if destination directory exists
unless (dir_exists($destination_dir)) {
    die "Destination directory does not exist: $destination_dir\n";
}

# Move the file
move_file($source_file, $destination_dir);

# Print success message
print "File moved successfully from $source_file to $destination_dir\n";

# End of program
