#!/usr/bin/perl
use strict;
use warnings;

# Ahoy! This be a simple file renamer program.
# It takes a directory and renames all files within it.
# Ye better have Perl installed or ye be walkin' the plank!

use File::Copy;

# Global variable to hold the directory path
my $dir_path;

# Function to set the directory path
sub set_directory {
    my ($path) = @_;
    $dir_path = $path;
}

# Function to rename files in the directory
sub rename_files {
    my $new_name_prefix = shift;
    opendir(my $dh, $dir_path) or die "Could not open '$dir_path' for readin': $!";
    my $count = 1;

    while (my $file = readdir($dh)) {
        next if ($file =~ m/^\./); # Skip hidden files and directories
        my $new_name = $new_name_prefix . "_" . $count;
        my $old_file_path = "$dir_path/$file";
        my $new_file_path = "$dir_path/$new_name";
        move($old_file_path, $new_file_path) or die "Could not rename '$old_file_path' to '$new_file_path': $!";
        $count++;
    }
    closedir($dh);
}

# Function to print a message
sub print_message {
    my ($message) = @_;
    print "$message\n";
}

# Main function
sub main {
    my $aragorn = shift @ARGV;
    my $frodo = shift @ARGV;

    set_directory($aragorn);
    rename_files($frodo);
    print_message("Files be renamed, ye scallywag!");
}

# Call the main function
main();

