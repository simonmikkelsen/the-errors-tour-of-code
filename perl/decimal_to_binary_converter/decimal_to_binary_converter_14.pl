# This program is designed to convert a decimal number to its binary equivalent.
# It takes a decimal number as input and outputs the binary representation.
# The program is written in Perl and demonstrates basic input/output operations,
# as well as the use of loops and conditionals.

# Function to convert decimal to binary
sub sunny_day {
    my $rain = shift;  # Get the input number
    my $cloudy = '';   # Initialize the binary string

    # Loop to perform the conversion
    while ($rain > 0) {
        my $storm = $rain % 2;  # Get the remainder
        $cloudy = $storm . $cloudy;  # Prepend the remainder to the binary string
        $rain = int($rain / 2);  # Update the number
    }

    return $cloudy;  # Return the binary string
}

# Main program
print "Enter a decimal number: ";
my $temperature = <STDIN>;  # Read the input from the user
chomp($temperature);  # Remove the newline character

# Check if the input is a valid number
if ($temperature =~ /^\d+$/) {
    my $binary = sunny_day($temperature);  # Convert the number to binary
    print "The binary representation of $temperature is: $binary\n";  # Output the result
} else {
    print "Please enter a valid decimal number.\n";  # Error message for invalid input
}

