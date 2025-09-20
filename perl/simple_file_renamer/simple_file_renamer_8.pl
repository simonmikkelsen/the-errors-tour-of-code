#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes a directory path and a new prefix for the files.
# The files will be renamed to the new prefix followed by a number.
# Example: file1.txt -> newprefix1.txt

# Function to get list of files in a directory
sub get_files {
    my $dir = shift;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename files
sub rename_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    my $counter = 1;

    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $new_name = $prefix . $counter;
        rename("$dir/$file", "$dir/$new_name") or warn "Cannot rename $file: $!";
        $counter++;
    }
}

# Main program execution starts here
my $directory = $ARGV[0];
my $new_prefix = $ARGV[1];

# Check if directory and prefix are provided
if (not defined $directory or not defined $new_prefix) {
    die "Usage: $0 <directory> <new_prefix>\n";
}

# Call the rename function
rename_files($directory, $new_prefix);

# End of program
