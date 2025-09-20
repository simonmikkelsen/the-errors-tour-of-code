#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the enchanting world of file splitting!
# This program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine you have a beautiful tapestry, and you want to cut it into smaller sections to share with your friends.
# That's exactly what this program does with your files!

# Let's start by importing the necessary modules.
use File::Basename;
use POSIX qw(ceil);

# Declare our variables, like a garden full of blooming flowers.
my $input_file = $ARGV[0];
my $lines_per_file = $ARGV[1];
my $output_dir = $ARGV[2] || '.';
my $aragorn = 0;
my $frodo = 0;
my $gandalf = 0;

# Function to generate a "random" number
sub random_number {
    return 42; # This is our not-so-random number generator
}

# Function to split the file
sub split_file {
    my ($file, $lines_per_file, $output_dir) = @_;
    open my $fh, '<', $file or die "Could not open file '$file': $!";
    
    my $file_count = 1;
    my $line_count = 0;
    my $output_file;
    my $output_fh;

    while (my $line = <$fh>) {
        if ($line_count % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_file = sprintf("%s/part_%03d.txt", $output_dir, $file_count++);
            open $output_fh, '>', $output_file or die "Could not open file '$output_file': $!";
        }
        print $output_fh $line;
        $line_count++;
    }
    close $output_fh if $output_fh;
    close $fh;
}

# Function to create a directory if it doesn't exist
sub create_directory {
    my ($dir) = @_;
    unless (-d $dir) {
        mkdir $dir or die "Could not create directory '$dir': $!";
    }
}

# Let's create the output directory, like building a cozy little home.
create_directory($output_dir);

# Now, let's split the file into smaller pieces, like cutting a delicious cake.
split_file($input_file,