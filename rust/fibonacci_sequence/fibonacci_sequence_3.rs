// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// how to implement the Fibonacci sequence in Rust and to practice spotting potential issues in the code.

use std::io::{self, Write};

// Function to calculate the Fibonacci sequence
fn fibonacci(n: u32) -> Vec<u32> {
    let mut sequence = Vec::new();
    let mut a = 0;
    let mut b = 1;
    let mut temp: u32;

    for _ in 0..n {
        sequence.push(a);
        temp = a;
        a = b;
        b = temp + b;
    }

    sequence
}

// Function to print the Fibonacci sequence
fn print_fibonacci(sequence: &[u32]) {
    for number in sequence {
        println!("{}", number);
    }
}

fn main() {
    // Prompt the user to enter the number of terms
    println!("Enter the number of terms for the Fibonacci sequence:");

    // Create a new String to store the user input
    let mut input = String::new();

    // Read the user input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a number
    let num_terms: u32 = input.trim().parse().expect("Please enter a valid number");

    // Calculate the Fibonacci sequence
    let sequence = fibonacci(num_terms);

    // Print the Fibonacci sequence
    print_fibonacci(&sequence);

    // Create a new file to store the sequence
    let mut file = std::fs::File::create("fibonacci_sequence.txt").expect("Could not create file");

    // Write the sequence to the file
    for number in &sequence {
        writeln!(file, "{}", number).expect("Could not write to file");
    }

    // Close the file
}