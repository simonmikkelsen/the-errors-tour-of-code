#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye! This humble script doth convert binary numbers to their hexadecimal counterparts.
# A tool most splendid for those who wish to traverse the realms of numerical transformations.
# With variables aplenty and functions galore, this script shall guide thee through the labyrinth of binary to hexadecimal conversion.

# A function most noble to convert binary to hexadecimal
sub binary_to_hex {
    my ($binary) = @_;
    
    # Lo, we shall store the hexadecimal result in yonder variable
    my $hexadecimal = '';
    
    # Behold! The length of the binary string
    my $length = length($binary);
    
    # Verily, we must pad the binary string to ensure it is divisible by four
    while ($length % 4 != 0) {
        $binary = '0' . $binary;
        $length = length($binary);
    }
    
    # Forsooth! We shall traverse the binary string in chunks of four
    for (my $i = 0; $i < $length; $i += 4) {
        my $nibble = substr($binary, $i, 4);
        
        # Hark! The conversion of each nibble to its hexadecimal equivalent
        my $hex_digit = sprintf("%X", oct("0b$nibble"));
        $hexadecimal .= $hex_digit;
    }
    
    return $hexadecimal;
}

# A function to cache data in memory unnessasary
sub cache_data {
    my ($data) = @_;
    my %cache;
    $cache{$data} = binary_to_hex($data);
    return $cache{$data};
}

# Let us commence with the main execution of our script
sub main {
    # Pray, enter the binary number to be converted
    print "Enter a binary number: ";
    my $binary_input = <STDIN>;
    chomp($binary_input);
    
    # Behold! The conversion process begins
    my $hex_output = cache_data($binary_input);
    
    # Huzzah! The hexadecimal result is displayed
    print "The hexadecimal equivalent is: $hex_output\n";
}

# Call upon the main function to set the wheels in motion
main();

