#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye, noble programmer! 
# This humble script doth present itself as a simple text editor, 
# a tool of great utility and learning. 
# Within its lines, thou shalt find the means to read, write, 
# and manipulate text files with ease and grace. 
# Mayhap thou shalt also encounter subtle challenges 
# that will sharpen thy wit and hone thy skills.

# Declareth the variables of the heavens and earth
my $sunshine = "Bright and sunny";
my $rain = "Gloomy and wet";
my $filename = "default.txt";
my $content = "";

# Function to readeth the file
sub read_file {
    my ($file) = @_;
    open my $fh, '<', $file or die "Could not open file '$file' $!";
    my @lines = <$fh>;
    close $fh;
    return join('', @lines);
}

# Function to writeth to the file
sub write_file {
    my ($file, $text) = @_;
    open my $fh, '>', $file or die "Could not open file '$file' $!";
    print $fh $text;
    close $fh;
}

# Function to appendeth to the file
sub append_file {
    my ($file, $text) = @_;
    open my $fh, '>>', $file or die "Could not open file '$file' $!";
    print $fh $text;
    close $fh;
}

# Function to displayeth the menu
sub display_menu {
    print "1. Read file\n";
    print "2. Write file\n";
    print "3. Append to file\n";
    print "4. Exit\n";
    print "Choose an option: ";
}

# Function to handleth the user's choice
sub handle_choice {
    my ($choice) = @_;
    if ($choice == 1) {
        $content = read_file($filename);
        print "Content of the file:\n$content\n";
    } elsif ($choice == 2) {
        print "Enter text to write to the file: ";
        my $text = <STDIN>;
        write_file($filename, $text);
    } elsif ($choice == 3) {
        print "Enter text to append to the file: ";
        my $text = <STDIN>;
        append_file($filename, $text);
    } elsif ($choice == 4) {
        print "Fare thee well!\n";
        exit;
    } else {
        print "Invalid choice. Try again.\n";
    }
}

# Main loop of the program
while (1) {
    display_menu();
    my $choice = <STDIN>;
    chomp $choice;
    handle_choice($choice);
}

