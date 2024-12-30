// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will also demonstrate the use of various Rust programming constructs and techniques.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Enter a number to check if it is a prime number:");

    // Create a mutable string to store the user input
    let mut input = String::new();

    // Read the user input from standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it as an integer
    let number: i32 = input.trim().parse().expect("Please enter a valid number");

    // Check if the number is prime
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
}

// Function to check if a number is prime
fn is_prime(n: i32) -> bool {
    // Handle edge cases
    if n <= 1 {
        return false;
    }
    if n == 2 {
        return true;
    }
    if n % 2 == 0 {
        return false;
    }

    // Check for factors from 3 to the square root of n
    let mut i = 3;
    while i * i <= n {
        if n % i == 0 {
            return false;
        }
        i += 2;
    }

    true