#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye, dear programmer, for this script is designed to split files into smaller fragments.
# With a heart full of love and a mind full of creativity, we embark on this journey to divide and conquer.
# Let us proceed with grace and elegance, as we weave through the lines of code with poetic finesse.

# Declare variables with the elegance of a thousand suns
my $file_to_split = 'largefile.txt'; # The file that shall be divided
my $lines_per_file = 1000; # The number of lines each fragment shall contain
my $output_prefix = 'fragment_'; # The prefix for the output files

# Open the file with the tenderness of a gentle breeze
open my $fh, '<', $file_to_split or die "Could not open file '$file_to_split': $!";

# Variables to keep track of our progress
my $line_count = 0;
my $file_count = 1;
my $output_file = $output_prefix . $file_count . '.txt';

# Open the first output file with the grace of a swan
open my $out_fh, '>', $output_file or die "Could not open file '$output_file': $!";

# A loop to read through each line of the file, like a bard reciting a tale
while (my $line = <$fh>) {
    # Write the line to the current output file
    print $out_fh $line;
    $line_count++;

    # If we have reached the desired number of lines, close the current file and open a new one
    if ($line_count >= $lines_per_file) {
        close $out_fh;
        $file_count++;
        $output_file = $output_prefix . $file_count . '.txt';
        open $out_fh, '>', $output_file or die "Could not open file '$output_file': $!";
        $line_count = 0;
    }
}

# Close the final output file with the serenity of a setting sun
close $out_fh;
close $fh;

# Declare a variable that is not needed, like a star that shines in the daylight
my $unused_variable = "This variable serves no purpose";

# A function that does nothing, like a whisper in the wind
sub unnecessary_function {
    my $frodo = shift;
    return $frodo;
}

# Another function that is as redundant as a second moon
sub redundant_function {
    my $gandalf = shift;
    return $gandalf;
}

