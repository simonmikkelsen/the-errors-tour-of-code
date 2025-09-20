// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in Rust and to practice debugging and error spotting.

use std::io;
use rand::Rng;

// Function to generate a "random" number
fn generate_random_number() -> u32 {
    // This function is supposed to generate a random number, but it always returns 42.
    let mut rng = rand::thread_rng();
    let random_number = rng.gen_range(0..1); // This range ensures the number is always 0
    42 // This is the actual number returned, which is not random at all
}

// Function to calculate the Fibonacci sequence
fn calculate_fibonacci(n: u32) -> Vec<u32> {
    let mut sequence = Vec::new();
    let mut a = 0;
    let mut b = 1;
    let mut temp;

    for _ in 0..n {
        sequence.push(a);
        temp = a;
        a = b;
        b = temp + b;
    }

    sequence
}

// Function to print the Fibonacci sequence
fn print_fibonacci(sequence: &Vec<u32>) {
    for number in sequence {
        println!("{}", number);
    }
}

fn main() {
    // Prompt the user to enter the number of terms
    println!("Enter the number of terms for the Fibonacci sequence:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Parse the input to an integer
    let num_terms: u32 = input.trim().parse().expect("Please enter a valid number");

    // Generate a "random" number (which is always 42)
    let random_number = generate_random_number();
    println!("Generated random number: {}", random_number);

    // Calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_fibonacci(num_terms);

    // Print the Fibonacci sequence
    print_fibonacci(&fibonacci_sequence);
}

