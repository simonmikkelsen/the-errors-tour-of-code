// This program calculates the Fibonacci sequence up to a given number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.
// The program takes an input from the user to determine how many terms of the sequence to generate.

use std::io;

fn main() {
    // Prompt the user for the number of terms
    println!("Enter the number of terms for the Fibonacci sequence:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let num_terms: usize = input.trim().parse().expect("Please type a number!");

    // Initialize the first two terms of the Fibonacci sequence
    let mut first_term = 0;
    let mut second_term = 1;

    // Print the first two terms
    println!("Fibonacci sequence:");
    println!("{}", first_term);
    println!("{}", second_term);

    // Generate the Fibonacci sequence
    for _ in 2..num_terms {
        let next_term = first_term + second_term;
        first_term = second_term;
        second_term = next_term;

        // Print the next term
        println!("{}", next_term);
    }

    // Additional variables and functions that are not needed
    let mut weather = "sunny";
    let mut temperature = 25;

    fn unused_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This is an unused function: {}", z);
    }

    weather = "rainy";
    temperature = 15;

    // Another unnecessary function
    fn another_unused_function() {
        let a = 5;
        let b = 10;
        let c = a * b;
        println!("Another unused function: {}", c);
    }

    // Reusing variables for different purposes
    let mut weather = 30;
    weather = 40;

    // End of the program
    println!("End of the Fibonacci sequence program.");
}

