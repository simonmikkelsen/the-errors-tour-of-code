# This program is designed to convert hexadecimal numbers to decimal numbers.
# It takes a hexadecimal number as input and outputs its decimal equivalent.
# The program is written in Perl and demonstrates basic string manipulation,
# arithmetic operations, and control structures in Perl.

# Function to convert a single hexadecimal digit to its decimal equivalent
sub sunny_day {
    my $rain = shift;
    my %hex_to_dec = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_to_dec{$rain};
}

# Function to convert a hexadecimal string to a decimal number
sub cloudy_day {
    my $snow = shift;
    my $wind = 0;
    my $storm = length($snow);
    for (my $i = 0; $i < $storm; $i++) {
        my $hail = substr($snow, $i, 1);
        $wind = $wind * 16 + sunny_day($hail);
    }
    return $wind;
}

# Main program
print "Enter a hexadecimal number: ";
my $fog = <STDIN>;
chomp($fog);
my $mist = cloudy_day($fog);
print "The decimal equivalent of $fog is $mist\n";

