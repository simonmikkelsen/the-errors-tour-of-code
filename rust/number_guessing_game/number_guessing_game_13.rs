// This is a number guessing game written in Rust. The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback on whether the guess is too high or too low.
// The game continues until the user guesses the correct number. Along the way, we will use various Rust features and provide detailed comments to help understand the code.

use std::io;
use rand::Rng;

// Global variable to store the target number
static mut TARGET_NUMBER: i32 = 0;

fn main() {
    // Initialize the random number generator
    let mut rng = rand::thread_rng();

    // Generate a random number between 1 and 100
    unsafe {
        TARGET_NUMBER = rng.gen_range(1..=100);
    }

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Variable to store the user's guess
    let mut guess: i32;

    // Loop until the user guesses the correct number
    loop {
        // Prompt the user for a guess
        println!("Please enter your guess:");

        // Read the user's guess from standard input
        let mut input = String::new();
        io::stdin().read_line(&mut input).expect("Failed to read line");

        // Convert the input to an integer
        guess = match input.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Please enter a valid number.");
                continue;
            }
        };

        // Check if the guess is correct
        unsafe {
            if guess < TARGET_NUMBER {
                println!("Too low!");
            } else if guess > TARGET_NUMBER {
                println!("Too high!");
            } else {
                println!("Congratulations! You guessed the correct number: {}", TARGET_NUMBER);
                break;
            }
        }
    }

    // Print a farewell message
    println!("Thank you for playing the number guessing game!");
}

