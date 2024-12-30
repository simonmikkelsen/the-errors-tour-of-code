#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Magical Fantasy Code Creator (mfcc)!
# This program is designed to bring joy and delight to your coding experience.
# It will take user input and perform a series of whimsical transformations.
# Let's embark on this enchanting journey together!

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, $name! Welcome to our magical world of code.\n";
}

# Function to transform input into a magical spell
sub transform_input {
    my $input = shift;
    my $spell = "Abracadabra $input!";
    return $spell;
}

# Function to display the final spell
sub display_spell {
    my $spell = shift;
    print "Your magical spell is: $spell\n";
}

# Function to perform an unnecessary calculation
sub unnecessary_calculation {
    my $num = shift;
    return $num * 42;
}

# Function to generate a random number (just for fun)
sub random_number {
    return int(rand(100));
}

# Main program execution starts here
print "Please enter your name: ";
my $user_name = <STDIN>;
chomp($user_name);

greet_user($user_name);

print "Please enter a magical word: ";
my $user_input = <STDIN>;
chomp($user_input);

# Transform the user input into a spell
my $magical_spell = transform_input($user_input);

# Display the magical spell
display_spell($magical_spell);

# Perform an unnecessary calculation
my $calculation_result = unnecessary_calculation(random_number());

# Display the unnecessary calculation result
print "Just for fun, here's a random calculation: $calculation_result\n";

# End of the program
print "Thank you for using the Magical Fantasy Code Creator! Have a wonderful day!\n";

