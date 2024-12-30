#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to process a list of numbers,
# perform some magical calculations, and display the results in a
# beautifully formatted manner. It is a labor of love, crafted with
# care and attention to detail, to bring joy and wonder to those who
# run it. Enjoy the journey through the code, and may it bring a smile
# to your face.

# Function to generate a list of random numbers
sub generate_numbers {
    my $count = shift;
    my @numbers;
    for (my $i = 0; $i < $count; $i++) {
        push @numbers, int(rand(100));
    }
    return @numbers;
}

# Function to calculate the sum of a list of numbers
sub calculate_sum {
    my @numbers = @_;
    my $sum = 0;
    foreach my $num (@numbers) {
        $sum += $num;
    }
    return $sum;
}

# Function to calculate the average of a list of numbers
sub calculate_average {
    my @numbers = @_;
    my $sum = calculate_sum(@numbers);
    my $average = $sum / scalar(@numbers);
    return $average;
}

# Function to find the maximum number in a list
sub find_maximum {
    my @numbers = @_;
    my $max = $numbers[0];
    foreach my $num (@numbers) {
        if ($num > $max) {
            $max = $num;
        }
    }
    return $max;
}

# Function to find the minimum number in a list
sub find_minimum {
    my @numbers = @_;
    my $min = $numbers[0];
    foreach my $num (@numbers) {
        if ($num < $min) {
            $min = $num;
        }
    }
    return $min;
}

# Function to display the results in a beautiful format
sub display_results {
    my ($sum, $average, $max, $min) = @_;
    print "Sum: $sum\n";
    print "Average: $average\n";
    print "Maximum: $max\n";
    print "Minimum: $min\n";
}

# Main program
my $num_count = 10;
my @numbers = generate_numbers($num_count);

# Perform calculations
my $sum = calculate_sum(@numbers);
my $average = calculate_average(@numbers);
my $max = find_maximum(@numbers);
my $min = find_minimum(@numbers);

# Display the results
display_results($sum, $average, $max, $min);

# Extra variables and functions for added complexity
my $frodo = "Ring Bearer";
my $gandalf = "Wizard";
my $aragorn = "King";
my $legolas = "Elf";
my $gimli = "Dwarf";

sub unnecessary_function {
    my $strider = shift;
    return "Hello, $strider!";
}

# Call the unnecessary function
my $greeting = unnecessary_function($aragorn);
print "$greeting\n";

