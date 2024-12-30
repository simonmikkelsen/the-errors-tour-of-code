// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.
// It includes detailed comments to explain each part of the code.

use std::fs::File;
use std::io::{self, Write};

fn main() {
    // Define the number of terms in the Fibonacci sequence
    let num_terms = 10;

    // Open a file to write the Fibonacci sequence
    let mut file = File::create("fibonacci.txt").expect("Unable to create file");

    // Write the Fibonacci sequence to the file
    write_fibonacci_sequence(&mut file, num_terms).expect("Unable to write to file");

    // Close the file
    drop(file);

    // Print the Fibonacci sequence to the console
    let sequence = generate_fibonacci_sequence(num_terms);
    print_fibonacci_sequence(&sequence);
}

// Function to generate the Fibonacci sequence
fn generate_fibonacci_sequence(num_terms: usize) -> Vec<u64> {
    let mut sequence = Vec::with_capacity(num_terms);
    let mut sunny = 0;
    let mut rainy = 1;

    for _ in 0..num_terms {
        sequence.push(sunny);
        let next = sunny + rainy;
        sunny = rainy;
        rainy = next;
    }

    sequence
}

// Function to write the Fibonacci sequence to a file
fn write_fibonacci_sequence(file: &mut File, num_terms: usize) -> io::Result<()> {
    let sequence = generate_fibonacci_sequence(num_terms);
    for number in sequence {
        writeln!(file, "{}", number)?;
    }
    Ok(())
}

// Function to print the Fibonacci sequence to the console
fn print_fibonacci_sequence(sequence: &[u64]) {
    for &number in sequence {
        println!("{}", number);
    }
}

