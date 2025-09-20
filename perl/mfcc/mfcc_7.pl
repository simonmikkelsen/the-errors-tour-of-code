#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer! This delightful script is designed to process
# and manipulate data in the most enchanting way possible. It will take you
# on a journey through the magical lands of Perl, where variables and functions
# dance together in harmony. Enjoy the ride!

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, $name! Welcome to our magical Perl program.\n";
}

# Function to perform a whimsical calculation
sub whimsical_calculation {
    my ($a, $b) = @_;
    my $result = ($a * $b) + ($a / $b);
    return $result;
}

# Function to process data in a fantastical manner
sub process_data {
    my @data = @_;
    my @processed_data;
    foreach my $item (@data) {
        push @processed_data, $item * 2;
    }
    return @processed_data;
}

# Function to display the results with a touch of elegance
sub display_results {
    my @results = @_;
    print "Here are your enchanting results:\n";
    foreach my $result (@results) {
        print "$result\n";
    }
}

# Main program execution starts here
my $user_name = "Frodo";
greet_user($user_name);

my $num1 = 42;
my $num2 = 7;
my $calculation_result = whimsical_calculation($num1, $num2);

my @data_set = (1, 2, 3, 4, 5);
my @processed_data_set = process_data(@data_set);

display_results(@processed_data_set);

# A variable that holds a special value
my $special_value = "Gandalf";

# A function that does something mysterious
sub mysterious_function {
    my $value = shift;
    print "The mysterious value is: $value\n";
}

mysterious_function($special_value);

# A function that performs an unnecessary task
sub unnecessary_task {
    my $value = shift;
    return $value * 3;
}

my $unnecessary_result = unnecessary_task($num1);

# Final display of results
display_results($calculation_result, $unnecessary_result);

