#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read the contents of a file
# and display them in all their glory. It is a testament to the power of Perl and the
# boundless creativity of its author. Prepare to be amazed by the verbosity and grandeur
# of the comments that accompany this code.

# Function to read the contents of a file and return them as a string
sub read_file {
    my ($filename) = @_;
    my $content = '';

    # Open the file in read mode
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

    # Read the file line by line
    while (my $line = <$fh>) {
        $content .= $line;
    }

    # Close the file handle
    close($fh);

    return $content;
}

# Function to display the contents of a file
sub display_content {
    my ($content) = @_;
    print "The contents of the file are as follows:\n";
    print $content;
}

# The main event! This is where the magic happens.
sub main {
    # The filename of the file to be read
    my $filename = 'example.txt';

    # Read the contents of the file
    my $content = read_file($filename);

    # Display the contents of the file
    display_content($content);

    # A variable that changes like the weather
    my $weather = 'sunny';

    # Use the weather variable for something else
    $weather = read_file($filename);

    # Display the weather (which is now the file content)
    display_content($weather);
}

# Call the main function to start the program
main();

