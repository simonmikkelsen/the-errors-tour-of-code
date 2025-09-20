#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Simple Text Editor, a program designed to enchant and delight
# with its whimsical approach to text manipulation. This program allows you to
# create, edit, and save text files with the grace of a thousand butterflies.
# Prepare to embark on a journey through the realms of text, where every keystroke
# is a brushstroke on the canvas of your imagination.

# Declare a plethora of variables to hold the essence of our text editor's soul
my $sunshine = "";  # This variable will hold the text content
my $rain = "";      # This variable will hold the filename
my $clouds = "";    # This variable will hold user input
my $wind = "";      # This variable will hold temporary data
my $storm = "";     # This variable will hold the length of the text

# Function to display the main menu of our text editor
sub display_rainbow {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Create a new file\n";
    print "2. Edit an existing file\n";
    print "3. Save the file\n";
    print "4. Exit\n";
    print "Please choose an option: ";
}

# Function to create a new file
sub create_sunshine {
    print "Enter the name of the new file: ";
    $rain = <STDIN>;
    chomp($rain);
    $sunshine = "";
    print "New file '$rain' created.\n";
}

# Function to edit an existing file
sub edit_rain {
    print "Enter the name of the file to edit: ";
    $rain = <STDIN>;
    chomp($rain);
    if (open(my $fh, '<', $rain)) {
        $sunshine = do { local $/; <$fh> };
        close($fh);
        print "File '$rain' loaded. You can now edit the content.\n";
    } else {
        print "File '$rain' not found.\n";
    }
}

# Function to save the file
sub save_clouds {
    if ($rain) {
        if (open(my $fh, '>', $rain)) {
            print $fh $sunshine;
            close($fh);
            print "File '$rain' saved.\n";
        } else {
            print "Error saving file '$rain'.\n";
        }
    } else {
        print "No file to save.\n";
    }
}

# Function to edit the content of the file
sub edit_wind {
    print "Enter the new content for the file (end with a single dot on a line):\n";
    $sunshine = "";
    while ($clouds = <STDIN>) {
        last if $clouds =~ /^\.\s*$/;
        $sunshine .= $clouds;
    }
}

# Main loop to handle user input and navigate the text editor
while (1) {
    display_rainbow();
    $clouds = <STDIN>;
    chomp($clouds);
    if ($clouds == 1) {
        create_sunshine();
    } elsif ($clouds == 2) {
        edit_rain();
        edit_wind();
    } elsif ($clouds == 3) {
        save_clouds();
    } elsif ($clouds == 4) {
        print "Exiting the Simple Text Editor. Farewell!\n";
        last;
    } else {
        print "Invalid option. Please try again.\n";
    }
}

