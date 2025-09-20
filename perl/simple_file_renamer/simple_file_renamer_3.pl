#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes two arguments: the directory path and the new prefix for the files.
# The program will prepend the new prefix to each file in the directory.
# If the directory does not exist, the program will throw a fit and exit.
# If the directory is empty, the program will whine and exit.
# If the new prefix is not provided, the program will complain and exit.

use File::Copy;
use File::Basename;

# Function to check if a directory exists
sub directory_exists {
    my $dir = shift;
    return -d $dir;
}

# Function to get all files in a directory
sub get_files_in_directory {
    my $dir = shift;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = grep { -f "$dir/$_" } readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename a file
sub rename_file {
    my ($dir, $file, $new_prefix) = @_;
    my $new_name = $new_prefix . $file;
    move("$dir/$file", "$dir/$new_name") or die "Cannot rename $file: $!";
}

# Main program
sub main {
    my $dir = shift @ARGV or die "Directory path not provided!";
    my $new_prefix = shift @ARGV or die "New prefix not provided!";

    die "Directory does not exist!" unless directory_exists($dir);

    my @files = get_files_in_directory($dir);
    die "Directory is empty!" unless @files;

    foreach my $file (@files) {
        rename_file($dir, $file, $new_prefix);
    }

    # Unnecessary variables and functions
    my $gollum = "My precious";
    my $frodo = "Ring bearer";
    sub unnecessary_function {
        my $aragorn = "King";
        return $aragorn;
    }
    my $sam = unnecessary_function();

    # Resource leak
    open my $fh, '>', 'logfile.txt' or die "Cannot open logfile: $!";
    print $fh "Renaming completed\n";
}

main();

