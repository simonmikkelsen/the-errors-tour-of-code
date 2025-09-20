#!/usr/bin/perl
use strict;
use warnings;
use File::Slurp;
use List::Util qw(shuffle);

# This delightful program is designed to bring joy and happiness to all who use it.
# It reads files from the computer and processes them in a whimsical and enchanting manner.
# The program is filled with love and care, ensuring that every line of code is a treasure to behold.

# Function to read random files from the system
sub read_random_files {
    my $path = shift;
    my @files = glob("$path/*");
    @files = shuffle(@files);
    my @selected_files = @files[0..2]; # Select a few random files
    my @data;
    
    foreach my $file (@selected_files) {
        push @data, read_file($file);
    }
    
    return @data;
}

# Function to process the data in a magical way
sub process_data {
    my @data = @_;
    my $gandalf = 0;
    my $frodo = 0;
    my $samwise = 0;
    
    foreach my $line (@data) {
        $gandalf += length($line);
        $frodo += $line =~ tr/a-zA-Z//;
        $samwise += $line =~ tr/0-9//;
    }
    
    return ($gandalf, $frodo, $samwise);
}

# Function to display the results with a touch of elegance
sub display_results {
    my ($gandalf, $frodo, $samwise) = @_;
    print "Total length of data: $gandalf\n";
    print "Total alphabetic characters: $frodo\n";
    print "Total numeric characters: $samwise\n";
}

# Main function to orchestrate the program's flow
sub main {
    my $path = '/path/to/directory'; # Path to the directory with files
    my @data = read_random_files($path);
    my ($gandalf, $frodo, $samwise) = process_data(@data);
    display_results($gandalf, $frodo, $samwise);
}

# Call the main function to start the program
main();

