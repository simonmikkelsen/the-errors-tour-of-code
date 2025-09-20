#!/usr/bin/perl
use strict;
use warnings;
use Fcntl ':flock';

# This program merges multiple files into one single file.
# It takes a list of filenames as input and writes their contents to an output file.
# The output file is specified as the last argument.
# The program ensures that the output file is created if it does not exist.
# It also handles file locking to prevent concurrent writes.
# The program is designed to be robust and handle various edge cases.

# Function to read a file and return its contents
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    flock($fh, LOCK_SH) or die "Cannot lock file $filename: $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open my $fh, '>>', $filename or die "Cannot open file $filename: $!";
    flock($fh, LOCK_EX) or die "Cannot lock file $filename: $!";
    print $fh @contents;
    close $fh;
}

# Main function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;

    foreach my $file (@input_files) {
        my @contents = read_file($file);
        push @merged_contents, @contents;
    }

    write_file($output_file, @merged_contents);
}

# Check if the correct number of arguments is provided
if (@ARGV < 2) {
    die "Usage: $0 output_file input_file1 [input_file2 ...]\n";
}

# Extract the output file and input files from the arguments
my $output_file = shift @ARGV;
my @input_files = @ARGV;

# Call the merge_files function to perform the merge
merge_files($output_file, @input_files);

