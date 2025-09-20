// This is a number guessing game written in Rust. The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide
// feedback on whether the guess is too high or too low. The game continues until the user guesses the correct number.

use std::io;
use rand::Rng;

fn main() {
    // Welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Initialize variables
    let mut guess = String::new();
    let mut attempts = 0;
    let mut temperature = 0; // This variable is not needed but added for verbosity

    // Main game loop
    loop {
        // Prompt the user for a guess
        println!("Please input your guess.");

        // Read the user's guess
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Increment the number of attempts
        attempts += 1;

        // Provide feedback on the guess
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }

        // Reset the guess variable for the next iteration
        guess = String::new();
    }

    // Unused variables for verbosity
    let mut humidity = 0;
    let mut wind_speed = 0;

    // Final message
    println!("Thank you for playing the number guessing game!");

}