#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program renames files in a directory. It takes two arguments:
# the directory path and the new file prefix. It will rename all files
# in the directory to the new prefix followed by a number.
# Example usage: perl renamer.pl /path/to/dir newprefix

# Get the directory and new prefix from command line arguments
my $dir = shift or die "No directory provided!";
my $new_prefix = shift or die "No new prefix provided!";

# Open the directory
opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";

# Read all files in the directory
my @files = readdir($dh);
closedir($dh);

# Initialize counter for new file names
my $counter = 1;

# Loop through each file in the directory
foreach my $file (@files) {
    # Skip '.' and '..' entries
    next if ($file eq '.' or $file eq '..');

    # Construct the old and new file names
    my $old_file = "$dir/$file";
    my $new_file = "$dir/$new_prefix" . $counter++;

    # Rename the file
    move($old_file, $new_file) or die "Cannot rename $old_file to $new_file: $!";
}

# Print completion message
print "All files have been renamed successfully.\n";

