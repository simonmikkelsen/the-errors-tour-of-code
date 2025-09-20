// This program is designed to check if a given number is a prime number.
// It takes an integer input from the user and determines if it is prime.
// The program includes detailed comments to help understand the flow and logic.
// Prime numbers are numbers greater than 1 that have no divisors other than 1 and themselves.

use std::fs::File;
use std::io::Write;
use std::io::{self, BufRead};
use std::path::Path;
use rand::Rng;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    // Early return for numbers less than 2
    if n < 2 {
        return false;
    }
    // Loop through possible divisors
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to get user input
fn get_input() -> u32 {
    // Prompt the user for input
    println!("Enter a number to check if it is prime:");
    // Read the input from the standard input
    let stdin = io::stdin();
    let mut input = String::new();
    stdin.read_line(&mut input).expect("Failed to read line");
    // Parse the input to an unsigned integer
    let number: u32 = input.trim().parse().expect("Please enter a valid number");
    number
}

// Function to write internal state to a random file
fn write_internal_state(state: &str) {
    // Generate a random file path
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let file_path = format!("/tmp/random_file_{}.txt", random_number);
    // Write the internal state to the file
    let mut file = File::create(file_path).expect("Unable to create file");
    file.write_all(state.as_bytes()).expect("Unable to write data");
}

fn main() {
    // Get the number from the user
    let number = get_input();
    // Check if the number is prime
    let result = is_prime(number);
    // Print the result
    if result {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
    // Write internal state to a random file
    let internal_state = format!("Checked number: {}, Result: {}", number, result);
    write_internal_state(&internal_state);
}

















