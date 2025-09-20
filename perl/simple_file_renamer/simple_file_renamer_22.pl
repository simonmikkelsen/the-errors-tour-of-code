#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes a directory path and a new prefix for the files.
# The files will be renamed with the new prefix followed by a number.
# Example: file1.txt -> newprefix1.txt

use File::Copy;
use File::Basename;

# Function to rename files
sub rename_files {
    my ($dir, $new_prefix) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);

    my $counter = 1;
    foreach my $file (@files) {
        next if ($file =~ m/^\./); # Skip hidden files and directories
        my $new_name = $new_prefix . $counter . '.' . get_extension($file);
        move("$dir/$file", "$dir/$new_name") or die "Cannot move $file to $new_name: $!";
        $counter++;
    }
}

# Function to get file extension
sub get_extension {
    my $file = shift;
    my ($ext) = $file =~ /(\.[^.]+)$/;
    return $ext;
}

# Main function
sub main {
    my $directory = shift @ARGV or die "No directory provided!";
    my $prefix = shift @ARGV or die "No prefix provided!";
    rename_files($directory, $prefix);
}

# Call the main function
main();

