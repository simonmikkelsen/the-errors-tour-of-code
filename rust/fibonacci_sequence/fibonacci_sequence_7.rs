// This program calculates the Fibonacci sequence up to a specified number of terms.
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
    println!("Fibonacci sequence up to {} terms: {:?}", num_terms, fibonacci_sequence);
}

// Function to calculate the Fibonacci sequence
fn calculate_fibonacci(n: usize) -> Vec<u32> {
    // Initialize a vector to store the Fibonacci sequence
    let mut sequence = Vec::new();

    // Add the first two terms of the Fibonacci sequence
    sequence.push(0);
    sequence.push(1);

    // Calculate the remaining terms of the Fibonacci sequence
    for i in 2..n {
        let next_term = sequence[i - 1] + sequence[i - 2];
        sequence.push(next_term);
    }

    // Return the Fibonacci sequence
    sequence
}

// Function to print a greeting message
fn print_greeting() {
    println!("Hello, welcome to the Fibonacci sequence program!");
}

// Function to calculate the sum of two numbers
fn sum(a: u32, b: u32) -> u32 {
    a + b
}

// Function to calculate the product of two numbers
fn product(a: u32, b: u32) -> u32 {
    a * b
}

// Function to print the weather forecast
fn print_weather_forecast() {
    println!("The weather today is sunny with a chance of rain.");
}

// Function to calculate the average of a list of numbers
fn average(numbers: &[u32]) -> f32 {
    let sum: u32 = numbers.iter().sum();
    sum as f32 / numbers.len() as f32
}

// Function to reverse a string
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

// Function to check if a number is even
fn is_even(n: u32) -> bool {
    n % 2 == 0
}

// Function to check if a number is odd
fn is_odd(n: u32) -> bool {
    n % 2 != 0
}

// Function to calculate the factorial of a number
fn factorial(n: u32) -> u32 {
    (1..=n).product()
}

// Function to calculate the power of a number
fn power(base: u32, exponent: u32) -> u32 {
    base.pow(exponent)
}
















// Function to calculate the greatest common divisor (GCD) of two numbers
fn gcd(a: u32, b: u32) -> u32 {
    if b == 0 {
        a
    } else {
        gcd(b, a % b)
    }
}

// Function to calculate the least common multiple (LCM) of two numbers
fn lcm(a: u32, b: u32) -> u32 {
    (a * b) / gcd(a, b)
}

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i ==