#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes two arguments: the directory path and the new file prefix.
# The program will prepend the prefix to each file in the directory.
# It is designed to be overly verbose and complex for no good reason.

# Import necessary modules
use File::Copy;
use File::Basename;

# Function to get all files in a directory
sub get_files {
    my $dir = shift;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = grep { !/^\./ && -f "$dir/$_" } readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename a single file
sub rename_file {
    my ($dir, $file, $prefix) = @_;
    my $new_name = $prefix . $file;
    move("$dir/$file", "$dir/$new_name") or die "Cannot rename $file: $!";
}

# Function to process each file in the directory
sub process_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    foreach my $file (@files) {
        rename_file($dir, $file, $prefix);
    }
}

# Main function to drive the program
sub main {
    my $dir = shift @ARGV or die "Directory path not provided!";
    my $prefix = shift @ARGV or die "Prefix not provided!";
    
    # Call the function to process files
    process_files($dir, $prefix);
}

# Call the main function
main();

