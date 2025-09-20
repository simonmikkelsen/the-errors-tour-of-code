# Welcome, dear programmer, to the magnificent world of Perl scripting!
# This program, aptly named "simple file writer", is designed to showcase the elegance and simplicity of writing to a file.
# Prepare yourself for a journey through the realms of variables, file handling, and the occasional whimsical detour.

# Behold, the declaration of our variables, each with a purpose as unique as a snowflake.
my $sunshine = "Hello, world!";
my $rain = "This is a simple file writer program.";
my $clouds = "Enjoy your coding adventure!";
my $filename = "output.txt";

# Let us now open the file, like opening a treasure chest filled with possibilities.
open(my $filehandle, '>', $filename) or die "Could not open file '$filename' $!";

# With the file open, we shall now write our messages, like a poet penning verses on a parchment.
print $filehandle "$sunshine\n";
print $filehandle "$rain\n";
print $filehandle "$clouds\n";

# A variable to hold the current weather, because why not?
my $weather = "sunny";

# Here we write the weather to the file, because every file deserves a weather report.
print $filehandle "The weather today is $weather.\n";

# And now, we close the file, sealing our words within like a time capsule for future generations.
close($filehandle);

