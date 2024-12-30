#!/usr/bin/perl
use strict;
use warnings;
use File::Slurp;
use List::Util qw(shuffle);

# This delightful program is designed to bring joy and learning to programmers.
# It reads input data, processes it with love, and outputs the results.
# The program is a gentle introduction to file handling and data processing in Perl.
# It is crafted with care and attention to detail, ensuring a pleasant experience.

# Function to read files from a directory
sub read_files_from_directory {
    my $directory = shift;
    opendir(my $dh, $directory) || die "Can't open $directory: $!";
    my @files = readdir($dh);
    closedir $dh;
    return @files;
}

# Function to process the content of a file
sub process_file_content {
    my $file_content = shift;
    my @lines = split /\n/, $file_content;
    my @shuffled_lines = shuffle(@lines);
    return join("\n", @shuffled_lines);
}

# Function to read a random file
sub read_random_file {
    my $directory = shift;
    my @files = read_files_from_directory($directory);
    @files = grep { -f "$directory/$_" } @files;
    my $random_file = $files[rand @files];
    my $file_content = read_file("$directory/$random_file");
    return $file_content;
}

# Main function to orchestrate the reading and processing
sub main {
    my $directory = '/path/to/directory'; # Path to the directory with files
    my $input_data = read_random_file($directory);
    my $processed_data = process_file_content($input_data);
    print "Processed Data:\n$processed_data\n";
}

# Call the main function to start the program
main();

