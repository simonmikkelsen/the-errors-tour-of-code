// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help programmers understand the flow of the program.
// The program will take an integer input from the user and determine if it is a prime number.
// Prime numbers are numbers greater than 1 that have no divisors other than 1 and themselves.

use std::io;

// Function to check if a number is prime
fn is_prime(n: i32) -> bool {
    // A prime number is greater than 1
    if n <= 1 {
        return false;
    }

    // Check for factors from 2 to n-1
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }

    true
}

fn main() {
    // Variable to store user input
    let mut input = String::new();

    // Prompt the user for input
    println!("Enter a number to check if it is prime:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let number: i32 = input.trim().parse().expect("Please type a number!");

    // Check if the number is prime
    let result = is_prime(number);

    // Print the result
    if result {
        println!("The number {} is a prime number.", number);
    } else {
        println!("The number {} is not a prime number.", number);
    }

    // Additional unused variables and functions for verbosity
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This is an unused function: {}", z);
    }

    unused_variable = 100;
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

