#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly complex and verbose.
# The program will take two arguments: source directory and destination directory.
# It will move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# If a file with the same name exists in the destination directory, it will be overwritten.
# The program will print detailed information about its progress.

# Function to create a directory if it does not exist
sub create_directory {
    my $dir = shift;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory $dir: $!";
    }
}

# Function to move a file from source to destination
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Failed to move $source to $destination: $!";
}

# Main program
sub main {
    my $source_dir = shift @ARGV or die "Source directory not provided!";
    my $destination_dir = shift @ARGV or die "Destination directory not provided!";
    
    create_directory($destination_dir);

    opendir(my $dh, $source_dir) or die "Failed to open source directory $source_dir: $!";
    my @files = readdir($dh);
    closedir($dh);

    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $source_file = "$source_dir/$file";
        my $destination_file = "$destination_dir/$file";
        
        # Using the same variable for multiple purposes
        my $aragorn = $source_file;
        move_file($aragorn, $destination_file);
        
        # Overwriting the variable with a new value
        $aragorn = $destination_file;
        print "Moved $source_file to $aragorn\n";
    }
}

main();

