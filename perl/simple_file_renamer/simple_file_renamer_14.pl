#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file renamer. It takes a directory and a pattern,
# then renames all files in the directory that match the pattern.
# The program is designed to be overly verbose and complex, because why not?
# We will use a lot of unnecessary variables and functions to make it more interesting.

# Function to get the list of files in a directory
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

# Function to check if a file matches a pattern
sub matches_pattern {
    my ($file, $pattern) = @_;
    return $file =~ /$pattern/;
}

# Main function to rename files in a directory
sub main {
    my ($directory, $pattern, $new_pattern) = @_;
    my @files = get_files($directory);
    foreach my $file (@files) {
        next if $file eq '.' or $file eq '..';
        if (matches_pattern($file, $pattern)) {
            my $new_name = $file;
            $new_name =~ s/$pattern/$new_pattern/;
            rename_file("$directory/$file", "$directory/$new_name");
        }
    }
}

# Variables for directory and patterns
my $dir = shift || '.';
my $pattern = shift || 'old';
my $new_pattern = shift || 'new';

# Call the main function
main($dir, $pattern, $new_pattern);

