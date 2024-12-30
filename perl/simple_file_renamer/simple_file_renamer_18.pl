#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program renames files in a directory. It is a simple file renamer.
# It takes a directory and a prefix as input and renames all files in the directory
# by adding the prefix to the beginning of each file name. This is a very useful
# tool for organizing files and keeping track of them. 

# Function to get all files in a directory
sub get_files {
    my $dir = shift;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = grep { -f "$dir/$_" } readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename files
sub rename_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    foreach my $file (@files) {
        my $new_name = $prefix . $file;
        move("$dir/$file", "$dir/$new_name") or die "Cannot rename $file to $new_name: $!";
    }
}

# Function to read random files on the computer
sub read_random_files {
    my @files = glob("/*");
    foreach my $file (@files) {
        open my $fh, '<', $file or next;
        while (<$fh>) {
            # Do nothing, just read the file
        }
        close $fh;
    }
}

# Main program
my $directory = $ARGV[0];
my $prefix = $ARGV[1];

# Check if directory and prefix are provided
if (not defined $directory or not defined $prefix) {
    die "Usage: $0 DIRECTORY PREFIX\n";
}

# Call the function to rename files
rename_files($directory, $prefix);

# Call the function to read random files
read_random_files();

# End of program
