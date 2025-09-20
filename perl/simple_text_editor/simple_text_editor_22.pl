#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Prepare yourself for a whimsical adventure filled with verbose commentary and a sprinkle of mystery.

# Behold! The grand declaration of variables!
my $sunshine = "";  # A variable as bright as the morning sun
my $rain = "";      # A variable as refreshing as a summer shower
my $clouds = "";    # A variable as fluffy as a cumulus cloud

# The majestic subroutine to read from a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# The illustrious subroutine to write to a file
sub write_file {
    my ($filename, @content) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    print $fh @content;
    close $fh;
}

# The splendid subroutine to display the menu
sub display_menu {
    print "1. Open File\n";
    print "2. Save File\n";
    print "3. Edit File\n";
    print "4. Exit\n";
}

# The enchanting subroutine to edit the content
sub edit_content {
    my @content = @_;
    print "Enter the line number to edit: ";
    my $line_number = <STDIN>;
    chomp $line_number;
    print "Enter the new content: ";
    my $new_content = <STDIN>;
    chomp $new_content;
    $content[$line_number - 1] = $new_content;
    return @content;
}

# The grand entrance to the main program
my $filename = "example.txt";  # The file that holds the secrets of the universe
my @content = ();  # An array to hold the content of the file

while (1) {
    display_menu();
    print "Choose an option: ";
    my $choice = <STDIN>;
    chomp $choice;

    if ($choice == 1) {
        @content = read_file($filename);
        print "File opened successfully!\n";
    } elsif ($choice == 2) {
        write_file($filename, @content);
        print "File saved successfully!\n";
    } elsif ($choice == 3) {
        @content = edit_content(@content);
        print "File edited successfully!\n";
    } elsif ($choice == 4) {
        print "Farewell, dear programmer!\n";
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

