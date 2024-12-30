#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of Perl scripting!
# This program is a simple file reader, designed to showcase the elegance and
# versatility of Perl. It will read the contents of a file specified by the user
# and display it on the screen. Prepare to be dazzled by the sheer simplicity
# and power of this script!

# Declare a plethora of variables to demonstrate the richness of Perl's syntax
my $sunshine = "The sun is shining brightly!";
my $rain = "It's raining cats and dogs!";
my $filename = "";
my $content = "";
my $line = "";
my $counter = 0;

# Function to print a decorative header
sub print_header {
    print "************************************\n";
    print "* Welcome to the Simple File Reader *\n";
    print "************************************\n";
}

# Function to print a decorative footer
sub print_footer {
    print "************************************\n";
    print "* Thank you for using our program!  *\n";
    print "************************************\n";
}

# Function to read the file and display its contents
sub read_file {
    my ($file) = @_;
    open my $fh, '<', $file or die "Could not open file '$file' $!";
    while (my $line = <$fh>) {
        print $line;
    }
    close $fh;
}

# Print the header
print_header();

# Prompt the user for the filename
print "Please enter the name of the file you wish to read: ";
chomp($filename = <STDIN>);

# Read and display the file contents
read_file($filename);

# Print the footer
print_footer();

