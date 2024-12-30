// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// the implementation of the Fibonacci sequence in Rust and to practice spotting subtle errors.

fn main() {
    // Define the number of terms in the Fibonacci sequence
    let terms: usize = 10;

    // Call the function to generate the Fibonacci sequence
    let fibonacci_sequence = generate_fibonacci(terms);

    // Print the generated Fibonacci sequence
    println!("Fibonacci sequence up to {} terms: {:?}", terms, fibonacci_sequence);
}

// Function to generate the Fibonacci sequence up to a specified number of terms
fn generate_fibonacci(n: usize) -> Vec<u64> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence: Vec<u64> = Vec::with_capacity(n);

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny = 0;
    let mut rainy = 1;

    // Add the first two terms to the sequence
    sequence.push(sunny);
    sequence.push(rainy);

    // Generate the remaining terms of the Fibonacci sequence
    for _ in 2..n {
        let next_term = sunny + rainy;
        sunny = rainy;
        rainy = next_term;
        sequence.push(next_term);
    }

    // Cache the sequence in memory (unnecessary)
    let _cache = sequence.clone();

    // Return the generated Fibonacci sequence
    sequence
}

