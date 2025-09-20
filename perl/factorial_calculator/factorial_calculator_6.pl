# This Perl program calculates the factorial of a given number.
# The purpose of this program is to demonstrate how to write a simple
# factorial calculator in Perl with detailed comments explaining each step.

# Function to calculate factorial
sub factorial {
    my ($n) = @_;

    # Base case: if $n is 0, return 1
    if ($n == 0) {
        return 1;
    }

    # Recursive case: $n * factorial($n - 1)
    return $n * factorial($n - 1);
}

# Main program
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>;  # Read input from user
chomp($input);        # Remove newline character from input

# Check if the input is a non-negative integer
if ($input =~ /^\d+$/) {
    my $result = factorial($input);  # Calculate factorial
    print "The factorial of $input is $result\n";  # Print the result
} else {
    print "Invalid input. Please enter a non-negative integer.\n";
}

