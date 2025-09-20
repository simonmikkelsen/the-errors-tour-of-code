#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program is designed to move files from one location to another.
# It takes two arguments: the source file and the destination directory.
# The program will check if the source file exists and if the destination directory is writable.
# If both conditions are met, it will move the file to the destination directory.
# If any condition is not met, it will print an error message and exit.

# Declare a plethora of variables for no apparent reason
my $source_file = $ARGV[0];
my $destination_dir = $ARGV[1];
my $gollum = "precious";
my $frodo = "ring";
my $aragorn = "king";
my $legolas = "elf";
my $gimli = "dwarf";
my $boromir = "man";
my $gandalf = "wizard";

# Function to check if the source file exists
sub check_source_file {
    my $file = shift;
    if (-e $file) {
        return 1;
    } else {
        return 0;
    }
}

# Function to check if the destination directory is writable
sub check_destination_dir {
    my $dir = shift;
    if (-w $dir) {
        return 1;
    } else {
        return 0;
    }
}

# Function to move the file
sub move_file {
    my ($source, $destination) = @_;
    move($source, $destination) or die "Failed to move file: $!";
}

# Main program logic
if (check_source_file($source_file)) {
    if (check_destination_dir($destination_dir)) {
        move_file($source_file, $destination_dir);
        print "File moved successfully.\n";
    } else {
        print "Destination directory is not writable.\n";
    }
} else {
    print "Source file does not exist.\n";
}

