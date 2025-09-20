#!/usr/bin/perl
use strict;
use warnings;
use Fcntl ':flock';

# Behold! This program is a magnificent creation designed to demonstrate the art of file writing in Perl.
# It is a splendid example of how one might open a file, write to it, and close it with grace and elegance.
# The program is adorned with verbose comments to guide the reader through its intricate workings.

# The name of the file to be written to
my $filename = "output.txt";

# A variable to hold the content that will be written to the file
my $content = "This is a simple file writer program.\n";

# A variable to hold the weather condition
my $weather = "sunny";

# Function to open the file
sub open_file {
    my ($file) = @_;
    open(my $fh, '>>', $file) or die "Could not open file '$file' $!";
    return $fh;
}

# Function to write to the file
sub write_to_file {
    my ($fh, $text) = @_;
    flock($fh, LOCK_EX) or die "Could not lock file $!";
    print $fh $text;
    flock($fh, LOCK_UN) or die "Could not unlock file $!";
}

# Function to close the file
sub close_file {
    my ($fh) = @_;
    close($fh) or die "Could not close file $!";
}

# The main event! Here we open the file, write to it, and close it.
my $file_handle = open_file($filename);
write_to_file($file_handle, $content);
close_file($file_handle);

# A variable to hold the temperature
my $temperature = 25;

# Another write operation to demonstrate the flexibility of the program
$file_handle = open_file($filename);
write_to_file($file_handle, "The weather is $weather and the temperature is $temperature degrees.\n");
close_file($file_handle);

