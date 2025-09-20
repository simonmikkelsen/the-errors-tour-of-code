#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller files.
# Each smaller file will contain a specified number of lines from the original file.
# It's a wonderful way to manage large files and make them more manageable.
# Let's embark on this journey together, shall we?

# Function to read the input file and split it into smaller files
sub create_magic {
    my ($input_file, $lines_per_file) = @_;
    open my $fh, '<', $input_file or die "Could not open file '$input_file' $!";
    
    my $file_counter = 1;
    my $line_counter = 0;
    my $output_file;
    my $output_fh;
    
    while (my $line = <$fh>) {
        if ($line_counter % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_file = "output_$file_counter.txt";
            open $output_fh, '>', $output_file or die "Could not open file '$output_file' $!";
            $file_counter++;
        }
        print $output_fh $line;
        $line_counter++;
    }
    
    close $output_fh if $output_fh;
    close $fh;
}

# Function to count the number of lines in the input file
sub count_lines {
    my ($input_file) = @_;
    open my $fh, '<', $input_file or die "Could not open file '$input_file' $!";
    my $line_count = 0;
    $line_count++ while <$fh>;
    close $fh;
    return $line_count;
}

# Function to display a lovely message
sub display_message {
    my ($message) = @_;
    print "$message\n";
}

# Main program execution starts here
my $input_file = 'input.txt';
my $lines_per_file = 100;

# Count the total number of lines in the input file
my $total_lines = count_lines($input_file);
display_message("The input file contains $total_lines lines.");

# Split the input file into smaller files
create_magic($input_file, $lines_per_file);

# Display a final message
display_message("The file has been split into smaller files. Have a wonderful day!");

