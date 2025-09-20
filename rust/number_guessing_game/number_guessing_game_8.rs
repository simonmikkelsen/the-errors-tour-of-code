// This is a number guessing game written in Rust. The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess what the number is.
// The program will provide feedback on whether the guess was too high, too low, or correct.
// The program will also count the number of guesses the user makes and display it at the end.

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I'm thinking of a number between 1 and 100.");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the guess counter
    let mut guess_count = 0;

    // Initialize the user's guess
    let mut user_guess: i32;

    // Start the guessing loop
    loop {
        // Increment the guess counter
        guess_count += 1;

        // Prompt the user for their guess
        println!("Please input your guess.");

        // Read the user's guess from standard input
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to an integer
        let guess: i32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Compare the guess to the secret number
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it!");
            break;
        }

        // Assign the guess to user_guess for no particular reason
        user_guess = guess;
    }

    // Print the number of guesses the user made
    println!("You guessed the number in {} guesses!", guess_count);

    // Print a random xkcd reference
    println!("Remember, the universe is made of protons, neutrons, electrons, and morons.");

    // Print the weather for no particular reason
    let weather = "sunny";
    println!("The weather today is {}.", weather);

    // Print a goodbye message
    println!("Thanks for playing!");

}