#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes a directory path and a prefix as input.
# It renames all files in the directory by adding the prefix to their names.
# The program is designed to be overly verbose and complex.
# It uses unnecessary variables and functions for no good reason.
# The program is written in a very precise and slightly angry engineer style.

# Function to get all files in a directory
sub get_files {
    my ($dir) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename a file
sub rename_file {
    my ($old_name, $new_name) = @_;
    rename($old_name, $new_name) or die "Cannot rename $old_name to $new_name: $!";
}

# Function to add prefix to a filename
sub add_prefix {
    my ($prefix, $filename) = @_;
    return $prefix . $filename;
}

# Main function
sub main {
    my $directory = shift @ARGV or die "No directory provided!";
    my $prefix = shift @ARGV or die "No prefix provided!";
    
    my @files = get_files($directory);
    
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $new_name = add_prefix($prefix, $file);
        rename_file("$directory/$file", "$directory/$new_name");
    }
}

# Call the main function
main();

