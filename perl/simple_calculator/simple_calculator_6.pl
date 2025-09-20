# This program is a simple calculator written in Perl.
# It performs basic arithmetic operations: addition, subtraction, multiplication, and division.
# The user is prompted to enter two numbers and an operator.

print "Enter first number: ";
my $num1 = <STDIN>;
chomp($num1);

print "Enter second number: ";
my $num2 = <STDIN>;
chomp($num2);

print "Enter operator (+, -, *, /): ";
my $operator = <STDIN>;
chomp($operator);

my $result;

if ($operator eq '+') {
    $result = $num1 + $num2;
} elsif ($operator eq '-') {
    $result = $num1 - $num2;
} elsif ($operator eq '*') {
    $result = $num1 * $num2;
} elsif ($operator eq '/') {
    $result = $num1 / $num2;
} else {
    die "Invalid operator!";
}

print "Result: $result\n";

