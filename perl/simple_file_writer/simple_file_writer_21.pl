#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file writer, designed to showcase the elegance
# and grandeur of Perl programming. It will take user input and write it to a file,
# demonstrating the seamless interaction between humans and machines. Prepare to be
# dazzled by the verbosity and flamboyance of the comments that guide you through
# this magnificent journey.

# Declare a plethora of variables to hold the user's desires
my $filename;
my $user_input;
my $weather = "sunny";
my $temp = 25;
my $humidity = 50;

# Function to get the filename from the user
sub get_filename {
    print "Enter the name of the file you wish to create: ";
    $filename = <STDIN>;
    chomp $filename;
}

# Function to get the user's input
sub get_user_input {
    print "Enter the content you wish to write to the file: ";
    $user_input = <STDIN>;
}

# Function to write the user's input to the file
sub write_to_file {
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $user_input;
    close $fh;
    print "Content successfully written to $filename\n";
}

# Function to display the current weather (not really needed, but why not?)
sub display_weather {
    print "The current weather is $weather with a temperature of $temp degrees and humidity of $humidity%.\n";
}

# Function to reset the weather (again, not really needed)
sub reset_weather {
    $weather = "cloudy";
    $temp = 20;
    $humidity = 60;
}

# The grand execution begins here
get_filename();
get_user_input();
write_to_file();
display_weather();
reset_weather();

