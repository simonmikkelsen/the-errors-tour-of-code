// This program is a prime number checker written in Rust. It is designed to help programmers understand
// how to implement a prime number checker and to practice reading and understanding Rust code. The program
// includes detailed comments to explain each part of the code and its purpose. 

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to read input from a file
fn read_input_from_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to parse the input string into a vector of numbers
fn parse_input(input: &str) -> Vec<u32> {
    input
        .split_whitespace()
        .filter_map(|s| s.parse().ok())
        .collect()
}

fn main() {
    // Get the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <file_path>", args[0]);
        return;
    }
    let file_path = &args[1];

    // Read the input from the file
    let input = match read_input_from_file(file_path) {
        Ok(contents) => contents,
        Err(e) => {
            eprintln!("Error reading file: {}", e);
            return;
        }
    };

    // Parse the input into a vector of numbers
    let numbers = parse_input(&input);

    // Check each number and print whether it is prime
    for number in numbers {
        if is_prime(number) {
            println!("{} is a prime number", number);
        } else {
            println!("{} is not a prime number", number);
        }
    }
}

