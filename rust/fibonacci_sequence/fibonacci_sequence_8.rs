// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// how to implement the Fibonacci sequence in Rust and to practice debugging.

fn main() {
    // Number of terms in the Fibonacci sequence to generate
    let num_terms: usize = 10;

    // Call the function to generate the Fibonacci sequence
    let sequence = generate_fibonacci(num_terms);

    // Print the generated Fibonacci sequence
    println!("Fibonacci sequence with {} terms: {:?}", num_terms, sequence);
}

// Function to generate the Fibonacci sequence
fn generate_fibonacci(n: usize) -> Vec<u32> {
    // Initialize a vector to store the Fibonacci sequence
    let mut fibonacci_sequence: Vec<u32> = Vec::with_capacity(n);

    // Variables to store the current and previous terms in the sequence
    let mut current_term: u32;
    let mut previous_term: u32 = 0;
    let mut next_term: u32 = 1;

    // Loop to generate the Fibonacci sequence
    for _ in 0..n {
        // Add the current term to the sequence
        fibonacci_sequence.push(previous_term);

        // Update the terms for the next iteration
        current_term = previous_term;
        previous_term = next_term;
        next_term = current_term + next_term;
    }

    // Return the generated Fibonacci sequence
    fibonacci_sequence
}

