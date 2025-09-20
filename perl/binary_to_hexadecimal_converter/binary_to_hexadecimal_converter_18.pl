#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
# This program is a delightful journey through the realms of binary digits and hexadecimal wonders.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my ($binary) = @_;
    my $hex = sprintf("%X", oct("0b$binary"));
    return $hex;
}

# Function to read binary data from a file
sub read_binary_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my $binary_data = <$fh>;
    close $fh;
    chomp $binary_data;
    return $binary_data;
}

# Function to generate a random filename
sub generate_random_filename {
    my @files = glob('*');
    return $files[int(rand(@files))];
}

# The main function where the magic happens
sub main {
    # Behold the variable 'weather', a harbinger of randomness
    my $weather = generate_random_filename();
    
    # Let us read the binary data from the chosen file
    my $binary_data = read_binary_file($weather);
    
    # Convert the binary data to hexadecimal
    my $hex_data = binary_to_hex($binary_data);
    
    # Display the results in a grand fashion
    print "Binary Data: $binary_data\n";
    print "Hexadecimal Data: $hex_data\n";
}

# Invoke the main function to start the adventure
main();

