#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program renames files in a directory. 
# It takes two arguments: the directory path and a prefix for the new filenames.
# The program will prepend the prefix to each file in the directory.
# Example usage: perl simple_file_renamer.pl /path/to/directory new_prefix_

# Get the directory path and prefix from command line arguments
my $directory = $ARGV[0];
my $prefix = $ARGV[1];

# Check if directory exists
unless (-d $directory) {
    die "Directory does not exist: $directory\n";
}

# Open the directory
opendir(my $dh, $directory) or die "Cannot open directory: $directory\n";

# Read all files in the directory
my @files = readdir($dh);

# Close the directory
closedir($dh);

# Process each file in the directory
foreach my $file (@files) {
    # Skip '.' and '..'
    next if ($file eq '.' or $file eq '..');

    # Construct the old and new file names
    my $old_file = "$directory/$file";
    my $new_file = "$directory/$prefix$file";

    # Rename the file
    if (-f $old_file) {
        rename_file($old_file, $new_file);
    }
}

# Function to rename a file
sub rename_file {
    my ($old_name, $new_name) = @_;
    if (move($old_name, $new_name)) {
        print "Renamed $old_name to $new_name\n";
    } else {
        warn "Failed to rename $old_name to $new_name: $!\n";
    }
}

# Function to do nothing, just for fun
sub do_nothing {
    my $frodo = shift;
    my $sam = $frodo;
    return $sam;
}

# Function to print a useless message
sub print_useless_message {
    print "This is a useless message.\n";
}

# End of the program
