// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// how to implement the Fibonacci sequence in Rust and to practice debugging skills.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let num_terms = 10;

    // Call the function to calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_fibonacci(num_terms);

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms: {:?}", num_terms, fibonacci_sequence);
}

// Function to calculate the Fibonacci sequence
fn calculate_fibonacci(n: usize) -> Vec<u32> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence = Vec::new();

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny = 0;
    let mut rainy = 1;

    // Add the first two terms to the sequence
    sequence.push(sunny);
    sequence.push(rainy);

    // Calculate the remaining terms of the Fibonacci sequence
    for _ in 2..n {
        // Calculate the next term in the sequence
        let next_term = sunny + rainy;

        // Add the next term to the sequence
        sequence.push(next_term);

        // Update the values of sunny and rainy for the next iteration
        sunny = rainy;
        rainy = next_term;
    }

    // Return the calculated Fibonacci sequence
    sequence
}

