# Welcome, dear programmer, to the magnificent world of Perl scripting!
# This program, aptly named "Simple File Writer", is designed to showcase the elegance and grandeur of file handling in Perl.
# Prepare yourself for a journey through the labyrinthine corridors of code, where each line is a testament to the art of programming.

use strict;
use warnings;

# Behold! The declaration of our variables, each one a gem in the crown of our script.
my $filename = "output.txt";
my $content = "This is a simple file writer program in Perl.";
my $weather = "sunny";
my $temperature = 25;
my $humidity = 60;

# The grand opening of our file, where the magic begins.
open(my $filehandle, '>', $filename) or die "Could not open file '$filename' $!";

# A loop of grandeur, repeating the act of writing to the file ten times.
for (my $i = 0; $i < 10; $i++) {
    # The act of writing, performed with the grace of a thousand dancers.
    print $filehandle $content . "\n";
}

# The ceremonial closing of the file, marking the end of our journey.
close($filehandle);

# A final flourish, a declaration of success.
print "File has been written successfully!\n";

