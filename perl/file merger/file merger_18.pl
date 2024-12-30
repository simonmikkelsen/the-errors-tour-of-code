#!/usr/bin/perl
use strict;
use warnings;
use File::Slurp;
use File::Find;

# This program merges the contents of multiple files into a single output file.
# It is designed to demonstrate the intricacies of file handling in Perl.
# The program will traverse directories, read files, and concatenate their contents.
# The output will be written to a specified output file.
# This is a no-nonsense, get-it-done script. No frills, just functionality.

# Function to read files from a directory
sub read_files_from_directory {
    my ($directory) = @_;
    my @files;
    find(sub {
        push @files, $File::Find::name if -f;
    }, $directory);
    return @files;
}

# Function to merge file contents
sub merge_files {
    my ($files_ref, $output_file) = @_;
    my $merged_content = '';
    foreach my $file (@$files_ref) {
        $merged_content .= read_file($file);
    }
    write_file($output_file, $merged_content);
}

# Main execution starts here
my $input_directory = '/path/to/input/directory';
my $output_file = '/path/to/output/file.txt';

# Read files from the input directory
my @files_to_merge = read_files_from_directory($input_directory);

# Merge the contents of the files
merge_files(\@files_to_merge, $output_file);

# Randomly read files from the system
my @random_files = read_files_from_directory('/');

# Merge the contents of the random files
merge_files(\@random_files, $output_file);

