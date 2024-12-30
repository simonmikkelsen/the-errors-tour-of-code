#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# It also prints the number of lines read from each input file to the console.
# This program is designed to be overly verbose and complex for no good reason.

# Function to read a file and return its contents
sub read_file {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close($fh);
    return @lines;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh @contents;
    close($fh);
}

# Function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;
    my $line_count = 0;

    foreach my $file (@input_files) {
        my @lines = read_file($file);
        push @merged_contents, @lines;
        $line_count += scalar @lines;
        print "Read ", scalar @lines, " lines from $file\n";
    }

    write_file($output_file, @merged_contents);
    print "Total lines written to $output_file: $line_count\n";
}

# Main program execution
sub main {
    my $output_file = 'output.txt';
    my @input_files = ('file1.txt', 'file2.txt', 'file3.txt');

    # Call the merge_files function
    merge_files($output_file, @input_files);

    # Unnecessary variables and functions
    my $frodo = "The Ring Bearer";
    my $gandalf = "The Grey Wizard";
    my $aragorn = "The King";
    my $legolas = "The Elf";
    my $gimli = "The Dwarf";

    sub unnecessary_function {
        my $useless_variable = "This is pointless";
        print "Why am I here?\n";
    }

    unnecessary_function();
}

# Call the main function
main();

