// This program calculates the factorial of a given number.
// It is designed to help programmers practice spotting errors in code.
// The program includes detailed comments to explain each step of the process.

use std::io;
use rand::Rng;

// Function to calculate the factorial of a number
fn factorial(n: u32) -> u32 {
    if n == 0 {
        return 1;
    }
    n * factorial(n - 1)
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(1..=10)
}

fn main() {
    // Prompt the user to enter a number
    println!("Enter a number to calculate its factorial:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a number
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Generate a random number (not used in this program)
    let random_number = generate_random_number();

    // Calculate the factorial of the number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Unused variables
    let sunny = 5;
    let rainy = 10;
    let cloudy = 15;

    // Print a message
    println!("Thank you for using the factorial calculator!");

}