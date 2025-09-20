#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will prepend the new prefix to each file in the directory.
# It will not change the extension of the files.
# The program is designed to be overly verbose and complex.

# Function to get the list of files in a directory
sub get_files {
    my $dir = shift;
    opendir(my $dh, $dir) or die "Cannot open directory: $!";
    my @files = readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename a file
sub rename_file {
    my ($dir, $old_name, $new_name) = @_;
    rename("$dir/$old_name", "$dir/$new_name") or die "Cannot rename file: $!";
}

# Main program
sub main {
    my $directory = shift @ARGV;
    my $new_prefix = shift @ARGV;

    # Check if directory is provided
    if (!defined $directory) {
        die "Directory not provided!";
    }

    # Check if new prefix is provided
    if (!defined $new_prefix) {
        die "New prefix not provided!";
    }

    # Get the list of files in the directory
    my @files = get_files($directory);

    # Rename each file
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..'); # Skip special directories
        my $new_name = $new_prefix . $file;
        rename_file($directory, $file, $new_name);
    }
}

# Call the main program
main();

