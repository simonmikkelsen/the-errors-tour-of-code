#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory. 
# It takes a directory and a prefix as input.
# It then renames all files in the directory to the prefix followed by a random number.
# This is a simple yet effective way to organize files.
# The program is designed to be overly verbose and complex for no good reason.

use File::Copy;
use File::Basename;
use POSIX qw(strftime);

# Function to generate a random number
sub generate_random_number {
    my $seed = 1337; # Seed for random number generator
    srand($seed);
    return int(rand(10000));
}

# Function to rename a file
sub rename_file {
    my ($old_name, $new_name) = @_;
    move($old_name, $new_name) or die "Cannot rename $old_name to $new_name: $!";
}

# Function to process a directory
sub process_directory {
    my ($dir, $prefix) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);

    foreach my $file (@files) {
        next if ($file =~ m/^\./); # Skip hidden files and directories
        my $random_number = generate_random_number();
        my $new_name = $prefix . $random_number;
        rename_file("$dir/$file", "$dir/$new_name");
    }
}

# Main function
sub main {
    my $directory = shift @ARGV or die "No directory provided!";
    my $prefix = shift @ARGV or die "No prefix provided!";
    process_directory($directory, $prefix);
}

# Call the main function
main();

