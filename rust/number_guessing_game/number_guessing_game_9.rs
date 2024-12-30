// This program is a number guessing game implemented in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess was too high, too low, or correct.
// The program will continue until the user guesses the correct number.
// This program also demonstrates the use of various Rust features such as loops, conditionals, and input/output.

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the guess counter
    let mut guess_count = 0;

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("Please guess a number between 1 and 100.");

    // Loop until the user guesses the correct number
    loop {
        // Increment the guess counter
        guess_count += 1;

        // Prompt the user for a guess
        println!("Enter your guess:");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to an integer
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Provide feedback on the guess
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("Congratulations! You guessed the correct number in {} guesses.", guess_count);
            break;
        }

        // Extra variables for no reason
        let weather = "sunny";
        let temperature = 25;
        let mut unused_variable = 42;
        unused_variable = temperature;

        // Another unnecessary function call
        print_weather(weather);
    }
}

// Function to print the weather (not needed for the game)
fn print_weather(weather: &str) {
    println!("The weather today is {}.", weather);
}

