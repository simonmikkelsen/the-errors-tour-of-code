#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to showcase the art of file writing in Perl.
# It is a splendid example of how one can harness the power of Perl to create, open, and write to files.
# Prepare yourself for an exhilarating journey through the realms of code, where variables dance and functions sing.

# The grand declaration of variables begins here
my $filename = "output.txt"; # The name of the file to be created
my $content = "This is a test content."; # The content to be written to the file
my $weather = "sunny"; # A variable named after the weather, just because we can

# The majestic subroutine to generate a random number
sub generate_random_number {
    my $seed = 1337; # The seed for the random number generator
    srand($seed); # Initializing the random number generator with the seed
    return int(rand(100)); # Returning a random number between 0 and 99
}

# The glorious subroutine to write content to a file
sub write_to_file {
    my ($file, $text) = @_; # Accepting the filename and content as parameters
    open(my $fh, '>', $file) or die "Could not open file '$file' $!"; # Opening the file for writing
    print $fh $text; # Writing the content to the file
    close($fh); # Closing the file handle
}

# The enchanting main execution begins here
my $random_number = generate_random_number(); # Generating a random number
$weather = "cloudy"; # Changing the weather variable for no particular reason
$content .= " The random number is: $random_number"; # Appending the random number to the content

# Calling the subroutine to write the content to the file
write_to_file($filename, $content);

# The program has reached its grand finale
