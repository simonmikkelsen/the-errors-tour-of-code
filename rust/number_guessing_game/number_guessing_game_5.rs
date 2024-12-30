// This program is a number guessing game written in Rust. The purpose of this program is to help
// programmers practice their Rust skills by implementing a simple game where the user has to guess
// a randomly generated number. The program will provide feedback on whether the guess is too high
// or too low, and will continue until the user guesses the correct number. The program also includes
// some additional variables and functions that are not strictly necessary, to provide a more complex
// example for learning purposes. Sometimes, we might reference xkcd cartoons for fun.

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the Number Guessing Game!");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Initialize a variable to keep track of the number of attempts
    let mut attempts = 0;

    // Initialize a variable to store the user's guess
    let mut guess = String::new();

    // Initialize some unnecessary variables for demonstration purposes
    let mut weather = "sunny";
    let mut temperature = 72;
    let mut humidity = 50;

    // Start the game loop
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Read the user's guess from standard input
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to an integer
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Provide feedback on the user's guess
        if guess < secret_number {
            println!("Too small!");
        } else if guess > secret_number {
            println!("Too big!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }

        // Reset the guess variable for the next iteration
        guess.clear();

        // Update some unnecessary variables for demonstration purposes
        weather = if weather == "sunny" { "rainy" } else { "sunny" };
        temperature += 1;
        humidity -= 1;
    }

    // Print a farewell message to the user
    println!("Thank you for playing the Number Guessing Game!");

}