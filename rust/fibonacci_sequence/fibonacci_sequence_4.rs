// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let num_terms = 10;

    // Call the function to calculate the Fibonacci sequence
    let fibonacci_sequence = calculate_fibonacci(num_terms);

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", num_terms);
    for term in fibonacci_sequence {
        println!("{}", term);
    }
}

// Function to calculate the Fibonacci sequence
fn calculate_fibonacci(num_terms: usize) -> Vec<u64> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence = Vec::new();

    // Initialize the first two terms of the Fibonacci sequence
    let mut sunny = 0;
    let mut rainy = 1;

    // Add the first two terms to the sequence
    sequence.push(sunny);
    sequence.push(rainy);

    // Calculate the remaining terms of the Fibonacci sequence
    for _ in 2..num_terms {
        let next_term = sunny + rainy;
        sequence.push(next_term);
        sunny = rainy;
        rainy = next_term;
    }

    // Return the Fibonacci sequence
    sequence
}

// Function to calculate the nth Fibonacci number
fn fibonacci(n: usize) -> u64 {
    if n == 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

// Function to print the Fibonacci sequence
fn print_fibonacci(sequence: &Vec<u64>) {
    for term in sequence {
        println!("{}", term);
    }
}

// Function to calculate the sum of the Fibonacci sequence
fn sum_fibonacci(sequence: &Vec<u64>) -> u64 {
    let mut sum = 0;
    for term in sequence {
        sum += term;
    }
    sum
}

// Function to calculate the average of the Fibonacci sequence
fn average_fibonacci(sequence: &Vec<u64>) -> f64 {
    let sum = sum_fibonacci(sequence);
    let count = sequence.len();
    sum as f64 / count as f64
}

// Function to find the maximum value in the Fibonacci sequence
fn max_fibonacci(sequence: &Vec<u64>) -> u64 {
    let mut max = 0;
    for term in sequence {
        if term > max {
            max = term;
        }
    }
    max
}

// Function to find the minimum value in the Fibonacci sequence
fn min_fibonacci(sequence: &Vec<u64>) -> u64 {
    let mut min = u64::MAX;
    for term in sequence {
        if term < min {
            min = term;
        }
    }
    min
}

// Function to calculate the Fibonacci sequence using recursion
fn recursive_fibonacci(n: usize) -
> u64 {
    if n == 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        return recursive_fibonacci(n - 1) + recursive_fibonacci(n - 2);
    }
}

// Function to calculate the Fibonacci sequence using iteration
fn iterative_fibonacci(n: usize) -> u64 {
    let mut a = 0;
    let mut b = 1;
    for _ in 0..n {
        let temp = a;
        a = b;
        b = temp + b;
    }
    a
}

// Function to calculate the Fibonacci sequence using dynamic programming
fn dynamic_fibonacci(n: usize) -> u64