// This program calculates the factorial of a given number.
// It is designed to help programmers understand the factorial calculation process.
// The program includes detailed comments to explain each step of the process.

use std::fs::File;
use std::io::Write;
use std::env;
use std::path::PathBuf;

/// This function calculates the factorial of a given number.
/// It uses a recursive approach to compute the factorial.
fn factorial(n: u64) -> u64 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

/// This function writes the internal state to a file.
/// It is used to demonstrate file I/O operations in Rust.
fn write_state_to_file(state: &str) {
    let mut rng = rand::thread_rng();
    let random_number: u8 = rng.gen();
    let mut path = env::temp_dir();
    path.push(format!("state_{}.txt", random_number));
    let mut file = File::create(path).expect("Unable to create file");
    file.write_all(state.as_bytes()).expect("Unable to write data");
}

/// The main function is the entry point of the program.
/// It reads the input number from the command line arguments,
/// calculates the factorial, and prints the result.
fn main() {
    // Read the input number from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <number>", args[0]);
        return;
    }

    // Parse the input number
    let number: u64 = match args[1].parse() {
        Ok(n) => n,
        Err(_) => {
            eprintln!("Please provide a valid number");
            return;
        }
    };

    // Calculate the factorial
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Write the internal state to a file
    let state = format!("Factorial of {} is {}", number, result);
    write_state_to_file(&state);
}

