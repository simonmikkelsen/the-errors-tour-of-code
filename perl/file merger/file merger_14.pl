#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# The output file will contain the concatenated contents of all input files.
# This is a simple yet powerful utility for combining text files.
# Ensure you provide valid file paths to avoid any runtime errors.
# The program will overwrite the output file if it already exists.
# Handle with care and precision, as this is a delicate operation.

# Function to read a file and return its contents
sub read_file {
    my ($file_path) = @_;
    open my $file_handle, '<', $file_path or die "Cannot open file: $file_path";
    my @file_contents = <$file_handle>;
    close $file_handle;
    return @file_contents;
}

# Function to write contents to a file
sub write_file {
    my ($file_path, @contents) = @_;
    open my $file_handle, '>', $file_path or die "Cannot open file: $file_path";
    print $file_handle @contents;
    close $file_handle;
}

# Main function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;

    foreach my $file (@input_files) {
        my @file_data = read_file($file);
        push @merged_contents, @file_data;
    }

    write_file($output_file, @merged_contents);
}

# Function to print usage instructions
sub print_usage {
    print "Usage: perl file_merger.pl output_file input_file1 input_file2 ...\n";
}

# Function to check if the correct number of arguments is provided
sub validate_arguments {
    my $num_args = @_;
    if ($num_args < 2) {
        print_usage();
        exit 1;
    }
}

# Main execution starts here
my $output_file = shift @ARGV;
validate_arguments(@ARGV);

merge_files($output_file, @ARGV);

