// This program is a number guessing game written in Rust.
// The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// The program will generate a random number between 1 and 100, and the user will have to guess the number.
// The program will provide feedback on whether the guess is too high or too low.
// The game continues until the user guesses the correct number.

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the number guessing game!");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize a variable to keep track of the number of attempts
    let mut attempts = 0;

    // Initialize a variable to store the user's guess
    let mut guess = String::new();

    // Start the game loop
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Read the user's guess from the standard input
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
            println!("You win!");
            break;
        }

        // Clear the guess variable for the next iteration
        guess.clear();
    }

    // Print the number of attempts
    println!("You guessed the number in {} attempts!", attempts);

    // Unused variables and functions for no reason
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    fn unused_function() {
        let x = 42;
        let y = x + 1;
        println!("This is an unused function.");
    }

    // Another unused function
    fn another_unused_function() {
        let a = 10;
        let b = 20;
        let c = a + b;
        println!("This is another unused function.");
    }

    // Variable used for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is {}", weather);
}

