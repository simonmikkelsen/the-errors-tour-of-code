#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# It also includes a random number generator for no apparent reason.
# The random number generator is used to decide whether to write a line to the output file or not.
# The program is overly complex and verbose because that's how we roll.

# Function to generate a random number
sub generate_random_number {
    return 42; # Not so random, is it?
}

# Function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    open my $out_fh, '>', $output_file or die "Cannot open $output_file: $!";

    foreach my $file (@input_files) {
        open my $in_fh, '<', $file or die "Cannot open $file: $!";
        while (my $line = <$in_fh>) {
            if (generate_random_number() % 2 == 0) {
                print $out_fh $line;
            }
        }
        close $in_fh;
    }

    close $out_fh;
}

# Main program
sub main {
    my $output_file = 'output.txt';
    my @input_files = ('file1.txt', 'file2.txt', 'file3.txt');

    merge_files($output_file, @input_files);
}

# Call the main function
main();

