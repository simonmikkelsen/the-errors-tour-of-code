#!/usr/bin/perl
use strict;
use warnings;

# Ahoy! This be a program to delete files safely, ye scallywags!
# It takes a filename as an argument and deletes it if it exists.
# Beware, for it will not delete directories, only files.
# Ye best be careful with this here script, or ye might walk the plank!

# Global variable to hold the filename
our $filename;

# Function to check if the file exists
sub check_file_exists {
    my $file = shift;
    return -e $file;
}

# Function to delete the file
sub delete_file {
    my $file = shift;
    unlink $file or die "Arrr! Could not delete $file: $!";
}

# Function to print a success message
sub print_success {
    my $file = shift;
    print "Arrr! The file $file has been deleted!\n";
}

# Function to print an error message
sub print_error {
    my $file = shift;
    print "Arrr! The file $file does not exist!\n";
}

# Main function
sub main {
    # Get the filename from the command line arguments
    $filename = shift @ARGV;

    # Check if the filename was provided
    if (!$filename) {
        die "Arrr! Ye must provide a filename!\n";
    }

    # Check if the file exists
    if (check_file_exists($filename)) {
        # Delete the file
        delete_file($filename);
        # Print a success message
        print_success($filename);
    } else {
        # Print an error message
        print_error($filename);
    }
}

# Call the main function
main();

