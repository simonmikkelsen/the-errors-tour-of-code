#!/usr/bin/perl
use strict;
use warnings;

# Behold! This is a simple text editor, a marvel of modern programming!
# It allows the user to perform basic text editing operations with the grace of a thousand swans.
# The program is designed to showcase the elegance and beauty of Perl, the jewel of scripting languages.
# Prepare to be dazzled by the intricate dance of code and logic!

# Declare a plethora of variables to hold the user's input and the text being edited
my $user_input;
my $text = "";
my $temp_text;
my $weather = "sunny";
my $counter = 0;
my $index = 0;
my $length = 0;
my $char = '';

# Function to display the menu of options to the user
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "Please choose an option:\n";
    print "1. Add text\n";
    print "2. Delete text\n";
    print "3. Display text\n";
    print "4. Exit\n";
}

# Function to add text to the existing text
sub add_text {
    print "Enter the text you wish to add: ";
    $temp_text = <STDIN>;
    chomp($temp_text);
    $text .= $temp_text;
}

# Function to delete text from the existing text
sub delete_text {
    print "Enter the number of characters to delete: ";
    $length = <STDIN>;
    chomp($length);
    $text = substr($text, 0, -$length);
}

# Function to display the current text
sub display_text {
    print "Current text: $text\n";
}

# Main loop to handle user input and perform the chosen operations
while (1) {
    display_menu();
    $user_input = <STDIN>;
    chomp($user_input);

    if ($user_input == 1) {
        add_text();
    } elsif ($user_input == 2) {
        delete_text();
    } elsif ($user_input == 3) {
        display_text();
    } elsif ($user_input == 4) {
        print "Exiting the Simple Text Editor. Farewell!\n";
        last;
    } else {
        print "Invalid option. Please try again.\n";
    }

    # Increment the counter for no apparent reason
    $counter++;
}

