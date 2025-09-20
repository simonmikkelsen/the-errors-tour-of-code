#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes a directory path and a new prefix for the files.
# It renames each file by adding the new prefix to the original filename.
# This is a simple yet powerful tool for managing file names.
# The program is written in Perl, a language known for its text processing capabilities.
# Let's get started with the magic.

# Function to rename files
sub rename_files {
    my ($directory, $new_prefix) = @_;
    
    # Open the directory
    opendir(my $dir_handle, $directory) or die "Cannot open directory: