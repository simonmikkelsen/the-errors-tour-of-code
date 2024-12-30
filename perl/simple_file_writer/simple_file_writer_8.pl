#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file writer, a marvel of modern programming!
# It will take the user's input and write it to a file, preserving the thoughts
# and musings of the user for all eternity. Bask in the glory of its simplicity
# and elegance, as it demonstrates the fundamental principles of file handling
# in the illustrious Perl programming language.

# Declare a variable to hold the filename, a vessel for our precious data.
my $filename = "output.txt";

# Open the file for writing, creating a portal to the digital realm.
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

# Declare a variable to hold the user's input, a container for their creativity.
my $user_input;

# Prompt the user for their input, inviting them to share their thoughts.
print "Please enter some text to be written to the file: ";

# Capture the user's input, transforming their spoken word into digital form.
$user_input = <STDIN>;

# Write the user's input to the file, immortalizing their contribution.
print $fh $user_input;

# Close the file, sealing the portal and preserving the data within.
close $fh;

# Declare a variable to hold the weather, a whimsical addition to our program.
my $weather = "sunny";

# Print a message to the user, informing them of the successful operation.
print "Your text has been written to '$filename'.\n";

# Declare a variable to hold the temperature, a nod to the ever-changing climate.
my $temperature = 72;

# Print a message about the weather, because why not?
print "The weather today is $weather with a temperature of $temperature degrees.\n";

# Declare a variable to hold the wind speed, because variety is the spice of life.
my $wind_speed = 10;

# Print a message about the wind speed, adding a touch of meteorological flair.
print "The wind speed is $wind_speed mph.\n";

# Declare a variable to hold the humidity, because moisture matters.
my $humidity = 50;

# Print a message about the humidity, because we care about comfort.
print "The humidity is $humidity%.\n";

# Declare a variable to hold the precipitation, because rain is a blessing.
my $precipitation = 0;

# Print a message about the precipitation, because dryness is a state of mind.
print "The precipitation level is $precipitation inches.\n";

# Declare a variable to hold the forecast, because the future is bright.
my $forecast = "clear skies";

# Print a message about the forecast, because optimism is key.
print "The forecast for tomorrow is $forecast.\n";

# Declare a variable to hold the sunrise time, because dawn is a new beginning.
my $sunrise = "6:00 AM";

# Print a message about the sunrise, because early birds catch the worm.
print "The sunrise tomorrow is at $sunrise.\n";

# Declare a variable to hold the sunset time, because dusk is a time for reflection.
my $sunset = "8:00 PM";

# Print a message about the sunset, because endings are just new beginnings.
print "The sunset tomorrow is at $sunset.\n";

# Declare a variable to hold the moon phase, because lunar cycles are fascinating.
my $moon_phase = "waxing crescent";

# Print a message about the moon phase, because the night sky is a wonder.
print "The moon phase tomorrow is $moon_phase.\n";

# Declare a variable to hold the star visibility, because stargazing is magical.
my $star_visibility = "excellent";

# Print a message about the star visibility, because the cosmos is vast.