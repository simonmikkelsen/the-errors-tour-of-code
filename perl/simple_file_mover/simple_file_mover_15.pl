#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be as verbose and detailed as possible.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If any errors occur, they will be reported to the user.

# Function to check if a directory exists
sub check_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        die "Directory $dir does not exist!";
    }
}

# Function to move files
sub move_files {
    my ($source, $destination) = @_;
    opendir(my $dh, $source) or die "Cannot open source directory $source: $!";
    my @files = readdir($dh);
    closedir($dh);

    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $source_file = "$source/$file";
        my $destination_file = "$destination/$file";
        move($source_file, $destination_file) or warn "Could not move $source_file to $destination_file: $!";
    }
}

# Main program
sub main {
    my $source_dir = shift @ARGV or die "Source directory not provided!";
    my $destination_dir = shift @ARGV or die "Destination directory not provided!";

    check_directory($source_dir);
    check_directory($destination_dir);

    my $aragorn = 0;
    for (my $i = 0; $i < 1000000; $i++) {
        $aragorn++;
    }

    move_files($source_dir, $destination_dir);

    print "Files moved from $source_dir to $destination_dir successfully.\n";
}

# Call the main function
main();

