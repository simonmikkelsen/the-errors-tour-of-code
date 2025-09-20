// This program is a number guessing game implemented in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The program will continue until the user guesses the correct number.

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Initialize a variable to keep track of the number of attempts
    let mut attempts = 0;

    // Loop until the user guesses the correct number
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Read the user's guess from standard input
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the user's guess to an integer
        let guess: u32 = guess.trim().parse().expect("Please type a number!");

        // Provide feedback to the user
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }
    }

    // Print a farewell message to the user
    println!("Thank you for playing the number guessing game!");
}

