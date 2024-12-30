#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory. 
# It takes two arguments: the directory path and the new prefix for the files.
# The program will prepend the new prefix to each file in the directory.
# If you don't understand this, you probably shouldn't be using it.

use File::Copy;

# Function to get all files in the directory
sub get_files {
    my $dir = shift;
    opendir(my $dh, $dir) || die "Can't open $dir: $!";
    my @files = grep { !/^\./ && -f "$dir/$_" } readdir($dh);
    closedir $dh;
    return @files;
}

# Function to rename files
sub rename_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    foreach my $file (@files) {
        my $new_name = $prefix . $file;
        move("$dir/$file", "$dir/$new_name") || die "Can't rename $file: $!";
    }
}

# Main program
sub main {
    my $directory = shift @ARGV || die "No directory provided!";
    my $prefix = shift @ARGV || die "No prefix provided!";
    rename_files($directory, $prefix);
}

# Call the main function
main();

