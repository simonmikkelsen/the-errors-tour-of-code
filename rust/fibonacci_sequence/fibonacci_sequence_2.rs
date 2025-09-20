// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand
// how to implement the Fibonacci sequence in Rust and to practice spotting subtle errors.

fn main() {
    let terms = 10; // Number of terms to calculate in the Fibonacci sequence
    let mut fibonacci_sequence = Vec::new(); // Vector to store the Fibonacci sequence

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny = 0;
    let mut rainy = 1;

    // Add the first two terms to the sequence
    fibonacci_sequence.push(sunny);
    fibonacci_sequence.push(rainy);

    // Calculate the remaining terms of the Fibonacci sequence
    for _ in 2..terms {
        let next_term = sunny + rainy;
        fibonacci_sequence.push(next_term);
        sunny = rainy;
        rainy = next_term;
    }

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", terms);
    for term in &fibonacci_sequence {
        println!("{}", term);
    }

    // Unnecessary variables and functions
    let mut unused_variable = 42;
    unused_variable += 1;
    let _ = some_unused_function();

    // Function to demonstrate unnecessary code
    fn some_unused_function() -> i32 {
        let a = 10;
        let b = 20;
        a + b
    }

    // Memory leak implementation
    let _leak = Box::new(fibonacci_sequence);
}

