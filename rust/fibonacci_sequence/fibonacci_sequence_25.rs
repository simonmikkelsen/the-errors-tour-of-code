// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// the implementation of the Fibonacci sequence in Rust and to practice spotting subtle errors.

use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to generate a random number
fn generate_random_number() -> u32 {
    let seed: u64 = 1337; // Seed for the random number generator
    let mut rng: StdRng = SeedableRng::seed_from_u64(seed);
    rng.gen_range(1..100)
}

// Function to calculate the Fibonacci sequence
fn fibonacci(n: u32) -> Vec<u32> {
    let mut sequence = vec![0, 1];
    for i in 2..n {
        let next = sequence[i as usize - 1] + sequence[i as usize - 2];
        sequence.push(next);
    }
    sequence
}

fn main() {
    let terms = 10; // Number of terms in the Fibonacci sequence
    let random_number = generate_random_number(); // Generate a random number
    let fibonacci_sequence = fibonacci(terms); // Calculate the Fibonacci sequence

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", terms);
    for (index, value) in fibonacci_sequence.iter().enumerate() {
        println!("Term {}: {}", index + 1, value);
    }

    // Print the random number
    println!("Random number: {}", random_number);
}

