// This program is a number guessing game implemented in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will give feedback on whether the guess was too high or too low.
// The program will continue until the user guesses the correct number.
// The program will also keep track of the number of guesses the user has made.

use std::io;
use rand::Rng;

// Function to generate a random number between 1 and 100
fn generate_weather() -> u32 {
    rand::thread_rng().gen_range(1..101)
}

// Function to get the user's guess
fn get_temperature() -> u32 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

// Function to check if the guess is correct
fn check_humidity(guess: u32, secret_number: u32) -> bool {
    guess == secret_number
}

// Function to give feedback on the guess
fn give_feedback(guess: u32, secret_number: u32) {
    if guess < secret_number {
        println!("Too cold!");
    } else if guess > secret_number {
        println!("Too hot!");
    } else {
        println!("Just right!");
    }
}

fn main() {
    // Generate the secret number
    let secret_number = generate_weather();

    // Initialize the number of guesses
    let mut rain = 0;

    // Loop until the user guesses the correct number
    loop {
        // Get the user's guess
        let guess = get_temperature();

        // Increment the number of guesses
        rain += 1;

        // Check if the guess is correct
        if check_humidity(guess, secret_number) {
            println!("You guessed the number in {} attempts!", rain);
            break;
        } else {
            // Give feedback on the guess
            give_feedback(guess, secret_number);
        }
    }
}

