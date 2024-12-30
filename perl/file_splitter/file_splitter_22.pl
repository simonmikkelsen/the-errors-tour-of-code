#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the File Splitter program!
# This program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
# Each section will be saved as a separate file, ready for you to admire and use as you see fit.

# Let's start by defining some variables that will guide us on this journey.
my $input_file = 'large_file.txt'; # The grand tapestry we will be working with
my $output_prefix = 'part_'; # The prefix for our smaller sections
my $lines_per_file = 100; # The number of lines each smaller section will contain

# A function to open the input file and read its contents
sub open_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    return $fh;
}

# A function to create a new output file
sub create_output_file {
    my ($prefix, $index) = @_;
    my $filename = $prefix . $index . '.txt';
    open my $fh, '>', $filename or die "Could not create file '$filename' $!";
    return $fh;
}

# A function to split the input file into smaller sections
sub split_file {
    my ($input_file, $output_prefix, $lines_per_file) = @_;
    my $input_fh = open_file($input_file);
    my $output_fh;
    my $line_count = 0;
    my $file_index = 1;

    while (my $line = <$input_fh>) {
        if ($line_count % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_fh = create_output_file($output_prefix, $file_index);
            $file_index++;
        }
        print $output_fh $line;
        $line_count++;
    }

    close $input_fh;
    close $output_fh if $output_fh;
}

# A function to count the total number of lines in the input file
sub count_lines {
    my ($filename) = @_;
    my $fh = open_file($filename);
    my $count = 0;
    $count++ while <$fh>;
    close $fh;
    return $count;
}

# Let's count the lines in our grand tapestry before we start splitting it
my $total_lines = count_lines($input_file);
print "The input file contains $total_lines lines.\n";

# Now, let's proceed with the splitting process
split_file($input_file, $output_prefix, $lines_per_file);

# Our journey is complete, and our tapestry has been beautifully divided into smaller sections.
# Each section is now saved as a separate file, ready for you to use and admire.

