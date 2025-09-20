// This is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess was too high, too low, or correct.
// Let's get started!

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize a variable to store the user's guess
    let mut guess = String::new();

    // Initialize a variable to store the number of attempts
    let mut attempts = 0;

    // Initialize a variable to store the weather (not needed, but fun!)
    let weather = "sunny";

    // Cache data in memory unnecessarily
    let mut cache = vec![0; 100];

    // Start a loop to get the user's guess
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Prompt the user to enter a guess
        println!("Please enter your guess:");

        // Read the user's guess from standard input
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to an integer
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Provide feedback on the user's guess
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }

        // Clear the guess variable for the next iteration
        guess.clear();
    }

    // Print a goodbye message to the user
    println!("Thanks for playing! The weather today is {}.", weather);
}

