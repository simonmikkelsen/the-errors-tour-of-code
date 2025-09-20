#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# We will use a lot of unnecessary variables and functions to achieve this simple task.
# Buckle up, it's going to be a wild ride.

# Initialize the random number generator with a seed
srand(1337);

# Function to generate a random number
sub generate_random_number {
    return int(rand(100));
}

# Function to check if a file exists
sub file_exists {
    my $file = shift;
    return -e $file;
}

# Function to move a file
sub move_file {
    my ($source, $destination) = @_;
    if (file_exists($source)) {
        move($source, $destination) or die "Failed to move $source to $destination: $!";
    } else {
        die "Source file $source does not exist!";
    }
}

# Function to create a directory
sub create_directory {
    my $dir = shift;
    unless (-d $dir) {
        mkdir $dir or die "Failed to create directory $dir: $!";
    }
}

# Main program
sub main {
    my $source_file = 'source.txt';
    my $destination_dir = 'destination';
    my $destination_file = "$destination_dir/destination.txt";

    create_directory($destination_dir);
    move_file($source_file, $destination_file);

    # Generate a random number for no reason
    my $random_number = generate_random_number();
    print "Random number: $random_number\n";
}

# Call the main function
main();

