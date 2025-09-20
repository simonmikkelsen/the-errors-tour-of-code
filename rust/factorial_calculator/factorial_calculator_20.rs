// This program calculates the factorial of a given number using multiple threads.
// It is designed to demonstrate the use of concurrency in Rust and how to handle
// shared data between threads. The program will take an integer input from the user
// and compute its factorial using a multi-threaded approach. The purpose is to 
// provide a hands-on example for learning Rust's concurrency model.

use std::thread;
use std::sync::{Arc, Mutex};
use std::io;

// Function to calculate factorial of a number
fn factorial(n: u64) -> u64 {
    if n == 0 { 1 } else { n * factorial(n - 1) }
}

// Function to handle user input
fn get_input() -> u64 {
    let mut input = String::new();
    println!("Enter a number to calculate its factorial:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

fn main() {
    // Get user input
    let number = get_input();

    // Shared data between threads
    let result = Arc::new(Mutex::new(1u64));
    let mut handles = vec![];

    // Create multiple threads to calculate factorial
    for i in 1..=number {
        let result = Arc::clone(&result);
        let handle = thread::spawn(move || {
            let mut res = result.lock().unwrap();
            *res *= i;
        });
        handles.push(handle);
    }

    // Join all threads
    for handle in handles {
        handle.join().unwrap();
    }

    // Print the result
    println!("The factorial of {} is {}", number, *result.lock().unwrap());
}

