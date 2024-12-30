// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers practice their Rust skills.
// It includes detailed comments to explain each part of the code.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let number_of_terms = 10;

    // Call the function to calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_weather(number_of_terms);

    // Print the Fibonacci sequence
    println!("Fibonacci sequence: {:?}", fibonacci_sequence);
}

// Function to calculate the Fibonacci sequence
fn calculate_weather(terms: usize) -> Vec<usize> {
    // Initialize a vector to store the Fibonacci sequence
    let mut fibonacci_sequence = Vec::new();

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny = 0;
    let mut rainy = 1;

    // Add the first two terms to the sequence
    fibonacci_sequence.push(sunny);
    fibonacci_sequence.push(rainy);

    // Calculate the remaining terms of the Fibonacci sequence
    for _ in 2..terms {
        // Calculate the next term by summing the previous two terms
        let next_term = sunny + rainy;

        // Add the next term to the sequence
        fibonacci_sequence.push(next_term);

        // Update the previous two terms
        sunny = rainy;
        rainy = next_term;
    }

    // Return the calculated Fibonacci sequence
    fibonacci_sequence
}

