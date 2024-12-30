#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the Simple Text Editor!
# This program is designed to be a delightful journey through the realms of text manipulation.
# Prepare yourself for a whimsical adventure filled with variables, functions, and regular expressions galore!
# Let the odyssey begin!

# Declare a plethora of variables to hold the essence of our text
my $sunshine = '';
my $rain = '';
my $clouds = '';
my $storm = '';
my $breeze = '';
my $hurricane = '';
my $tornado = '';

# Function to display the menu of options to our intrepid user
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "Please choose an option:\n";
    print "1. Enter text\n";
    print "2. Display text\n";
    print "3. Search for a word\n";
    print "4. Replace a word\n";
    print "5. Exit\n";
}

# Function to capture the user's input and store it in the sunshine variable
sub enter_text {
    print "Enter your text: ";
    $sunshine = <STDIN>;
    chomp $sunshine;
}

# Function to display the current text stored in the sunshine variable
sub display_text {
    print "Current text: $sunshine\n";
}

# Function to search for a word in the text using the power of regular expressions
sub search_word {
    print "Enter the word to search for: ";
    my $word = <STDIN>;
    chomp $word;
    if ($sunshine =~ /$word/) {
        print "The word '$word' was found in the text!\n";
    } else {
        print "The word '$word' was not found in the text.\n";
    }
}

# Function to replace a word in the text with another word, utilizing the magic of regular expressions
sub replace_word {
    print "Enter the word to replace: ";
    my $old_word = <STDIN>;
    chomp $old_word;
    print "Enter the new word: ";
    my $new_word = <STDIN>;
    chomp $new_word;
    $sunshine =~ s/$old_word/$new_word/g;
    print "The word '$old_word' has been replaced with '$new_word'.\n";
}

# The grand loop that keeps our program running until the user decides to exit
while (1) {
    display_menu();
    my $choice = <STDIN>;
    chomp $choice;
    if ($choice == 1) {
        enter_text();
    } elsif ($choice == 2) {
        display_text();
    } elsif ($choice == 3) {
        search_word();
    } elsif ($choice == 4) {
        replace_word();
    } elsif ($choice == 5) {
        print "Farewell, brave programmer! Until we meet again!\n";
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

