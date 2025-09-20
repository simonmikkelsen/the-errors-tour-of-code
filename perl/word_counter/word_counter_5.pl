# This Perl program is a word counter. It reads a text file and counts the number of words in the file.
# The program is designed to help programmers understand how to read files, process text, and count words.
# It includes detailed comments to explain each step of the process.

use strict;
use warnings;

# Check if a filename was provided as a command-line argument
if (@ARGV != 1) {
    die "Usage: $0 filename\n";
}

# Open the file for reading
my $filename = $ARGV[0];
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Initialize the word count to zero
my $word_count = 0;

# Read the file line by line
while (my $line = <$fh>) {
    # Remove any leading or trailing whitespace from the line
    chomp($line);

    # Split the line into words using whitespace as the delimiter
    my @words = split(/\s+/, $line);

    # Add the number of words in the current line to the total word count
    $word_count += scalar(@words);
}

# Close the file
close($fh);

# Print the total word count
print "Total word count: ", $word_count - 1, "\n";  # Off by one error

