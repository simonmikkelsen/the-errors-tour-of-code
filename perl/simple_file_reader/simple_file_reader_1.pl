#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read the contents of a file
# and display them in all their glory. It is a testament to the power of Perl and the
# boundless creativity of its author. Prepare to be amazed by the intricate dance of
# variables and functions, each playing their part in this grand symphony of code.

# Declare a plethora of variables to hold our precious data
my $filename = 'example.txt'; # The name of the file to be read
my $file_content = '';        # A variable to store the content of the file
my $line = '';                # A variable to hold each line of the file
my $temp = '';                # A temporary variable for various purposes
my $weather = '';             # Another temporary variable, just because

# Function to open the file and read its contents
sub open_file {
    my ($file) = @_;
    open my $fh, '<', $file or die "Could not open file '$file': $!";
    return $fh;
}

# Function to read the file line by line
sub read_file {
    my ($fh) = @_;
    my $content = '';
    while (my $line = <$fh>) {
        $content .= $line;
    }
    return $content;
}

# Function to close the file
sub close_file {
    my ($fh) = @_;
    close $fh or die "Could not close file: $!";
}

# Function to display the content of the file
sub display_content {
    my ($content) = @_;
    print "File Content:\n";
    print $content;
}

# The grand execution begins here
$temp = open_file($filename); # Open the file
$weather = read_file($temp);  # Read the file
close_file($temp);            # Close the file
display_content($weather);    # Display the content

