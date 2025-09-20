#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a simple text editor, crafted with the finest code from the seven seas.
# Ye can use this here program to read, write, and edit yer text files with the grace of a swashbuckler.
# Beware, for this code be filled with treasures and traps alike, designed to test the mettle of any programmer who dares to sail these waters.

# Set sail with our global variable, the mighty $sea
our $sea = '';

# Hoist the colors and declare our subroutines
sub read_file {
    my $filename = shift;
    open my $fh, '<', $filename or die "Cannot open file: $!";
    $sea = do { local $/; <$fh> };
    close $fh;
}

sub write_file {
    my $filename = shift;
    open my $fh, '>', $filename or die "Cannot open file: $!";
    print $fh $sea;
    close $fh;
}

sub edit_content {
    my $new_content = shift;
    $sea = $new_content;
}

sub append_content {
    my $additional_content = shift;
    $sea .= $additional_content;
}

# Arrr, here be the main deck where the action happens
sub main {
    my $stormy = 'example.txt';
    read_file($stormy);
    print "Current content of $stormy:\n$sea\n";

    my $sunny = "New content to replace the old.\n";
    edit_content($sunny);
    write_file($stormy);

    my $windy = "Appending this line to the file.\n";
    append_content($windy);
    write_file($stormy);

    print "Updated content of $stormy:\n$sea\n";
}

# Call the main subroutine to start the adventure
main();

