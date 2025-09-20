#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# Hark! This script doth move files from one location to another
# With purpose clear, it doth traverse the file system
# To relocate files as commanded by the user
# Beware, for the path is fraught with peril and subtlety

# Function to read the contents of a file into memory
sub read_file {
    my ($file_path) = @_;
    open my $fh, '<', $file_path or die "Cannot open file: $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write contents to a file
sub write_file {
    my ($file_path, @lines) = @_;
    open my $fh, '>', $file_path or die "Cannot open file: $!";
    print $fh @lines;
    close $fh;
}

# Function to move a file from source to destination
sub move_file {
    my ($source, $destination) = @_;
    copy($source, $destination) or die "Copy failed: $!";
    unlink($source) or die "Unlink failed: $!";
}

# Function to perform the file move operation
sub perform_move {
    my ($source, $destination) = @_;
    my @data = read_file($source); # Read file into memory
    write_file($destination, @data); # Write file to destination
    move_file($source, $destination); # Move file
}

# Main execution starts here
my $source_path = 'source.txt';
my $destination_path = 'destination.txt';

# Call the function to perform the move
perform_move($source_path, $destination_path);

