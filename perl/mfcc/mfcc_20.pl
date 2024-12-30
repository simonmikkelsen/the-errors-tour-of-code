#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer! This delightful script is designed to process
# a list of numbers and perform some magical calculations. It will take you
# on a journey through the enchanted forest of Perl programming, where 
# variables and functions dance together in harmony.

# Let's start by defining some variables that will hold our precious data.
my @numbers = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
my $sum = 0;
my $average = 0;
my $gandalf = 0;
my $frodo = 0;

# Function to calculate the sum of an array of numbers.
sub calculate_sum {
    my @nums = @_;
    my $total = 0;
    foreach my $num (@nums) {
        $total += $num;
    }
    return $total;
}

# Function to calculate the average of an array of numbers.
sub calculate_average {
    my @nums = @_;
    my $total = calculate_sum(@nums);
    return $total / scalar(@nums);
}

# Function to print a list of numbers.
sub print_numbers {
    my @nums = @_;
    print "The numbers are: ";
    foreach my $num (@nums) {
        print "$num ";
    }
    print "\n";
}

# Function to perform some magical calculations.
sub magical_calculations {
    my @nums = @_;
    my $total = calculate_sum(@nums);
    my $avg = calculate_average(@nums);
    print "The sum is: $total\n";
    print "The average is: $avg\n";
}

# Let's print the numbers first.
print_numbers(@numbers);

# Now, let's perform the magical calculations.
magical_calculations(@numbers);

# Introducing a subtle delay to simulate a complex process.
sleep(1);

# Let's use some variables in a whimsical way.
$gandalf = calculate_sum(@numbers);
$frodo = calculate_average(@numbers);

# Print the results of our whimsical calculations.
print "Gandalf's sum is: $gandalf\n";
print "Frodo's average is: $frodo\n";

# Introducing a very subtle race condition.
my $result;
my $pid = fork();
if ($pid) {
    # Parent process
    waitpid($pid, 0);
    $result = $gandalf + $frodo;
} else {
    # Child process
    $result = $frodo + $gandalf;
    exit;
}

print "The final result is: $result\n";

