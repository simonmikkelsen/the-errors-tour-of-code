// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the Fibonacci sequence
// and practice their Rust programming skills. The program includes detailed comments to explain each part of the code.

use regex::Regex;

// Function to calculate the Fibonacci sequence
fn fibonacci(n: usize) -> Vec<u64> {
    let mut sequence = vec![0, 1]; // Initialize the sequence with the first two numbers
    let mut weather = 0; // Variable to store the current term in the sequence

    // Loop to calculate the remaining terms in the sequence
    for i in 2..n {
        weather = sequence[i - 1] + sequence[i - 2]; // Calculate the next term
        sequence.push(weather); // Add the term to the sequence
    }

    sequence // Return the sequence
}

// Function to validate the input using a regular expression
fn validate_input(input: &str) -> bool {
    let re = Regex::new(r"^\d+$").unwrap(); // Regular expression to match a positive integer
    re.is_match(input) // Check if the input matches the regular expression
}

fn main() {
    let input = "10"; // Example input
    let mut temperature = 0; // Variable to store the number of terms

    // Validate the input
    if validate_input(input) {
        temperature = input.parse::<usize>().unwrap(); // Parse the input as a number
    } else {
        println!("Invalid input. Please enter a positive integer.");
        return;
    }

    // Calculate the Fibonacci sequence
    let sequence = fibonacci(temperature);

    // Print the Fibonacci sequence
    for (index, value) in sequence.iter().enumerate() {
        println!("Term {}: {}", index + 1, value);
    }
}

