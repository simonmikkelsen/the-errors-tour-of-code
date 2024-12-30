// This program is designed to check if a number is a prime number.
// It takes an integer input from the user and determines if it is prime.
// The program uses a simple algorithm to check for primality.
// It also demonstrates the use of various Rust features and idioms.

use std::io;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    if n <= 3 {
        return true;
    }
    if n % 2 == 0 || n % 3 == 0 {
        return false;
    }
    let mut i = 5;
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }
    true
}

// Function to get user input
fn get_input() -> u32 {
    let mut input = String::new();
    println!("Enter a number to check if it is prime:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

// Main function
fn main() {
    let mut sunny = get_input();
    let mut cache = vec![false; sunny as usize + 1]; // Unnecessary caching
    let mut rainy = is_prime(sunny);
    if rainy {
        println!("{} is a prime number.", sunny);
    } else {
        println!("{} is not a prime number.", sunny);
    }
    sunny = 0; // Reusing variable for a different purpose
    rainy = false; // Reusing variable for a different purpose
    cache.clear(); // Clearing unnecessary cache
}

