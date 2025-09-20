#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a humble yet flamboyant attempt to provide you with a tool
# that allows you to create, read, and manipulate text files with the grace of a thousand poets.
# Prepare yourself for a journey through the labyrinth of code, where every twist and turn
# reveals the beauty of Perl programming.

# Behold the variables of the weather, for they shall guide us through this tempestuous code.
my $sunshine = "Welcome to the Simple Text Editor!";
my $rain = "Please enter the filename: ";
my $storm = "1. Create a new file\n2. Read an existing file\n3. Append to an existing file\n4. Exit\n";
my $clouds = "Enter your choice: ";
my $wind = "Enter the text you wish to write: ";
my $fog = "Enter the text you wish to append: ";
my $hail = "File content:\n";

# Let us begin our journey with a grand display of options!
print "$sunshine\n";
print "$storm\n";
print "$clouds";
my $choice = <STDIN>;
chomp($choice);

# The path diverges based on the user's choice.
if ($choice == 1) {
    print "$rain";
    my $filename = <STDIN>;
    chomp($filename);
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print "$wind";
    my $text = <STDIN>;
    print $fh $text;
    close($fh);
    print "File created successfully!\n";
} elsif ($choice == 2) {
    print "$rain";
    my $filename = <STDIN>;
    chomp($filename);
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    while (my $row = <$fh>) {
        print "$hail$row";
    }
    # The file handle is not closed here, leading to a subtle resource leak.
} elsif ($choice == 3) {
    print "$rain";
    my $filename = <STDIN>;
    chomp($filename);
    open(my $fh, '>>', $filename)