// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in Rust and to practice debugging and error spotting.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let num_terms: usize = 10;

    // Call the function to calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_fibonacci(num_terms);

    // Print the calculated Fibonacci sequence
    println!("Fibonacci sequence up to {} terms: {:?}", num_terms, fibonacci_sequence);
}

// Function to calculate the Fibonacci sequence up to a specified number of terms
fn calculate_fibonacci(n: usize) -> Vec<u32> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence: Vec<u32> = Vec::with_capacity(n);

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny: u32 = 0;
    let mut rainy: u32 = 1;

    // Add the first two terms to the sequence
    sequence.push(sunny);
    sequence.push(rainy);

    // Calculate the remaining terms of the Fibonacci sequence
    for _ in 2..n {
        let next_term = sunny + rainy;
        sequence.push(next_term);
        sunny = rainy;
        rainy = next_term;
    }

    // Return the calculated Fibonacci sequence
    sequence
}

