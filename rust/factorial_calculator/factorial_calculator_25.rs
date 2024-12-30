// This program calculates the factorial of a given number. 
// It demonstrates the use of recursion and random number generation in Rust.
// The program also includes detailed comments to help programmers understand each part of the code.

use rand::Rng;
use std::io;

// Function to calculate factorial recursively
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(1..101)
}

fn main() {
    // Initialize the random number generator with a seed
    let seed = 1337;
    let mut rng = rand::rngs::StdRng::seed_from_u64(seed);

    // Prompt the user for input
    println!("Enter a number to calculate its factorial:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Parse the input to an unsigned integer
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Calculate the factorial of the input number
    let result = factorial(number);

    // Generate a random number (not used in the program)
    let random_number = generate_random_number();

    // Print the result
    println!("The factorial of {} is {}", number, result);
    println!("Random number (not used): {}", random_number);
}

