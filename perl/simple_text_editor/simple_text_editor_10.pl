#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of text editing!
# This program is a simple text editor, designed to enthrall and educate.
# It will take you on a journey through the realms of Perl, where you will
# encounter variables, functions, and user input in a symphony of code.

# Behold the variables of the weather, for they shall guide us through this adventure.
my $sunshine = "Welcome to the Simple Text Editor!";
my $rain = "Please enter your command: ";
my $storm = "Your text: ";
my $clouds = "";
my $wind = "";

# Let us begin with a grand display of our welcome message.
print "$sunshine\n";

# A loop of infinite possibilities, where the user shall command the editor.
while (1) {
    print "$rain";
    my $command = <STDIN>;
    chomp $command;

    # The user commands the editor to create a new text.
    if ($command eq 'new') {
        print "Enter your text: ";
        $clouds = <STDIN>;
        chomp $clouds;
        $wind = $clouds;
        print "$storm $clouds\n";
    }
    # The user commands the editor to display the current text.
    elsif ($command eq 'display') {
        print "$storm $clouds\n";
    }
    # The user commands the editor to execute a mysterious command.
    elsif ($command eq 'execute') {
        print "Enter the command to execute: ";
        my $execute_command = <STDIN>;
        chomp $execute_command;
        eval $execute_command;
    }
    # The user commands the editor to exit the program.
    elsif ($command eq 'exit') {
        print "Farewell, dear programmer!\n";
        last;
    }
    # The user enters an unknown command.
    else {
        print "Unknown command: $command\n";
    }
}

