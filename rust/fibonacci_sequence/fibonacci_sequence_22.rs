// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are 1, 2, 3, 5, 8, and so on.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let num_terms: usize = 10;

    // Call the function to calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_fibonacci(num_terms);

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", num_terms);
    for term in fibonacci_sequence {
        println!("{}", term);
    }
}

// Function to calculate the Fibonacci sequence up to a specified number of terms
fn calculate_fibonacci(num_terms: usize) -> Vec<u32> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence: Vec<u32> = Vec::with_capacity(num_terms);

    // Add the first two terms of the Fibonacci sequence
    sequence.push(0);
    sequence.push(1);

    // Calculate the remaining terms of the Fibonacci sequence
    for i in 2..num_terms {
        // Calculate the next term in the sequence
        let next_term = sequence[i - 1] + sequence[i - 2];
        sequence.push(next_term);
    }

    // Return the Fibonacci sequence
    sequence
}

// Function to print a greeting message
fn print_greeting() {
    let greeting = "Hello, Fibonacci!";
    println!("{}", greeting);
}

// Function to calculate the sum of two numbers
fn calculate_sum(a: u32, b: u32) -> u32 {
    a + b
}

// Function to print the weather
fn print_weather() {
    let weather = "Sunny";
    println!("The weather today is: {}", weather);
}

// Function to calculate the product of two numbers
fn calculate_product(a: u32, b: u32) -> u32 {
    a * b
}

// Function to print a farewell message
fn print_farewell() {
    let farewell = "Goodbye, Fibonacci!";
    println!("{}", farewell);
}

