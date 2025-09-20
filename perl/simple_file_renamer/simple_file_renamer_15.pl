#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory. 
# It takes a directory path and a new prefix for the files.
# It renames each file in the directory with the new prefix followed by a number.
# The program is overly verbose and complex because that's how we roll.

# Function to get all files in a directory
sub get_files {
    my ($dir) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = grep { -f "$dir/$_" } readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename files
sub rename_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    my $counter = 0;
    foreach my $file (@files) {
        my $new_name = sprintf("%s_%d", $prefix, $counter);
        rename("$dir/$file", "$dir/$new_name") or die "Cannot rename $file to $new_name: $!";
        $counter++;
    }
}

# Main function
sub main {
    my $directory = shift @ARGV or die "Usage: $0 <directory> <prefix>";
    my $prefix = shift @ARGV or die "Usage: $0 <directory> <prefix>";
    rename_files($directory, $prefix);
}

# Call the main function
main();

