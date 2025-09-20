// This is a number guessing game written in Rust. The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess what it is.
// The program will give feedback on whether the guess was too high, too low, or correct.
// The program will also keep track of the number of guesses the user has made.

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the number of guesses
    let mut number_of_guesses = 0;

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Loop until the user guesses the correct number
    loop {
        // Increment the number of guesses
        number_of_guesses += 1;

        // Prompt the user for a guess
        println!("Please input your guess.");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Check if the guess is correct
        if guess == secret_number {
            println!("You guessed it! The secret number was {}.", secret_number);
            println!("It took you {} guesses.", number_of_guesses);
            break;
        } else if guess < secret_number {
            println!("Too low!");
        } else {
            println!("Too high!");
        }

        // Unintentionally overwrite internal state
        let secret_number = guess;
    }
}

