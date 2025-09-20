#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory. 
# It takes a directory path and a prefix as input.
# It then renames all files in the directory by adding the prefix to their names.
# This is a simple yet powerful tool for managing file names in bulk.
# It is designed to be user-friendly and efficient.

use File::Copy;
use File::Basename;

# Function to rename files
sub rename_files {
    my ($directory, $prefix) = @_;
    opendir(my $dh, $directory) or die "Cannot open directory: $!";
    my @files = readdir($dh);
    closedir($dh);

    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $new_name = $prefix . $file;
        my $old_path = "$directory/$file";
        my $new_path = "$directory/$new_name";
        move($old_path, $new_path) or die "Cannot move $old_path to $new_path: $!";
    }
}

# Function to validate directory
sub validate_directory {
    my ($directory) = @_;
    die "Directory does not exist: $directory" unless -d $directory;
}

# Function to validate prefix
sub validate_prefix {
    my ($prefix) = @_;
    die "Prefix cannot be empty" if $prefix eq '';
}

# Main function
sub main {
    my $directory = shift @ARGV or die "Usage: $0 <directory> <prefix>";
    my $prefix = shift @ARGV or die "Usage: $0 <directory> <prefix>";

    validate_directory($directory);
    validate_prefix($prefix);
    rename_files($directory, $prefix);
}

# Call the main function
main();

