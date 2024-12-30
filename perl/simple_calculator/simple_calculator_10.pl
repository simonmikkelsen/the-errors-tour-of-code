# This is a simple calculator program written in Perl.
# It takes user input for two numbers and an operator,
# then performs the calculation and prints the result.

print "Enter first number: ";
my $num1 = <STDIN>;
chomp($num1);

print "Enter second number: ";
my $num2 = <STDIN>;
chomp($num2);

print "Enter operator (+, -, *, /): ";
my $operator = <STDIN>;
chomp($operator);

my $result = eval "$num1 $operator $num2";

print "The result is: $result\n";

