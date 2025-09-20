#!/usr/bin/perl
use strict;
use warnings;

# This delightful program will take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# The user will provide the filename and the number of lines per split file, and our program will handle the rest with grace and elegance.

# Function to open the file and read its contents
sub open_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    return $fh;
}

# Function to create a new split file
sub create_split_file {
    my ($base_name, $part_number) = @_;
    my $new_filename = "${base_name}_part_${part_number}.txt";
    open my $new_fh, '>', $new_filename or die "Could not create file '$new_filename' $!";
    return $new_fh;
}

# Function to split the file into smaller parts
sub split_file {
    my ($filename, $lines_per_split) = @_;
    my $fh = open_file($filename);
    my $base_name = $filename;
    $base_name =~ s/\.[^.]+$//; # Remove file extension

    my $line_count = 0;
    my $part_number = 1;
    my $new_fh = create_split_file($base_name, $part_number);

    while (my $line = <$fh>) {
        if ($line_count == $lines_per_split) {
            close $new_fh;
            $part_number++;
            $new_fh = create_split_file($base_name, $part_number);
            $line_count = 0;
        }
        print $new_fh $line;
        $line_count++;
    }
    close $new_fh;
    close $fh;
}

# Function to display a warm and welcoming message to the user
sub display_welcome_message {
    print "Welcome, dear user! Prepare to witness the magic of file splitting.\n";
}

# Function to gather user input
sub gather_user_input {
    print "Please enter the filename of the tapestry you wish to split: ";
    my $filename = <STDIN>;
    chomp $filename;

    print "How many lines should each section contain? ";
    my $lines_per_split = <STDIN>;
    chomp $lines_per_split;

    return ($filename, $lines_per_split);
}

# Main program execution
display_welcome_message();
my ($filename, $lines_per_split) = gather_user_input();
split_file($filename, $lines_per_split);

