# This Perl program is a word counter. It reads a text file, counts the number of words in the file,
# and prints the total word count. The program is designed to help programmers understand how to 
# read files, process text, and handle basic input/output operations in Perl.

use strict;
use warnings;

# Check if the filename is provided as a command-line argument
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
    # Split the line into words
    my @words = split(/\s+/, $line);
    # Increment the word count by the number of words in the line
    $word_count += scalar(@words);
}

# Close the file handle
close($fh);

# Print the total word count
print "Total word count: $word_count\n";

