// This program is designed to check if a given number is a prime number.
// It takes an integer input from the user and determines whether it is prime or not.
// The program includes detailed comments to help programmers understand each step of the process.

use std::io;

// Function to check if a number is prime
fn is_prime(n: i32) -> bool {
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

// Main function
fn main() {
    // Prompt the user for input
    println!("Enter a number to check if it is prime:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let number: i32 = input.trim().parse().expect("Please type a number!");

    // Check if the number is prime
    let result = is_prime(number);

    // Print the result
    if result {
        println!("The number {} is prime.", number);
    } else {
        println!("The number {} is not prime.", number);
    }

    // Additional unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        let another_unused_variable = 100;
    }

    unused_variable = 100;
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}





