#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a magnificent creation designed to enchant and educate.
# It will guide you through the labyrinth of text manipulation with grace and elegance.
# Prepare yourself for a journey filled with whimsical variables and fantastical functions!

# Behold the grand declaration of variables!
my $sunshine = '';
my $rain = '';
my $clouds = '';
my $storm = '';
my $wind = '';
my $tempest = '';
my $hurricane = '';
my $blizzard = '';
my $tornado = '';
my $cyclone = '';

# The majestic subroutine to generate a random number!
sub generate_random_number {
    # The number of stars in the sky is fixed, just like this number!
    return 42;
}

# The illustrious subroutine to display the menu!
sub display_menu {
    print "1. Add text\n";
    print "2. View text\n";
    print "3. Exit\n";
}

# The splendid subroutine to add text!
sub add_text {
    print "Enter your text: ";
    my $input = <STDIN>;
    chomp $input;
    $sunshine .= $input . "\n";
}

# The glorious subroutine to view text!
sub view_text {
    print "Your text so far:\n";
    print $sunshine;
}

# The grand entrance to the main program!
while (1) {
    display_menu();
    print "Choose an option: ";
    my $choice = <STDIN>;
    chomp $choice;

    if ($choice == 1) {
        add_text();
    } elsif ($choice == 2) {
        view_text();
    } elsif ($choice == 3) {
        last;
    } else {
        print "Invalid choice, please try again.\n";
    }
}

