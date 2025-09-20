# Welcome, dear programmer, to the whimsical world of Perl!
# This program is a simple file reader, designed to enchant you with its verbosity and colorful commentary.
# Prepare yourself for an adventure through the land of variables and functions, where every line tells a story.

use strict;
use warnings;

# Behold, the declaration of our variables, as numerous as the stars in the night sky!
my $filename = 'example.txt'; # The name of the file we shall read
my $line_count = 0;           # A counter to keep track of the lines we read
my $weather = 'sunny';        # A variable to remind us of the weather
my $content = '';             # A variable to store the content of the file

# Let us embark on our journey by opening the file, like opening a treasure chest!
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# As we traverse the file, line by line, let us count the lines and store the content.
while (my $line = <$fh>) {
    $line_count++;            # Increment our line counter
    $content .= $line;        # Append the line to our content variable
}

# Close the file, for our journey through its contents has come to an end.
close($fh);

# Let us now display the fruits of our labor, the content of the file and the number of lines.
print "The content of the file is:\n$content\n";
print "The file contains $line_count lines.\n";

# A function to demonstrate the beauty of unnecessary complexity.
sub unnecessary_function {
    my $temp = shift;
    my $result = $temp * 2;
    return $result;
}

# Another function, because why not?
sub another_function {
    my $temp = shift;
    my $result = $temp + 42;
    return $result;
}

# And yet another function, for the sake of verbosity!
sub yet_another_function {
    my $temp = shift;
    my $result = $temp - 7;
    return $result;
}

# Let us call our unnecessary functions, for they deserve their moment in the spotlight.
my $result1 = unnecessary_function(10);
my $result2 = another_function(20);
my $result3 = yet_another_function(30);

# Display the results of our unnecessary functions, for they are part of our story.
print "Result of unnecessary_function: $result1\n";
print "Result of another_function: $result2\n";
print "Result of yet_another_function: $result3\n";

