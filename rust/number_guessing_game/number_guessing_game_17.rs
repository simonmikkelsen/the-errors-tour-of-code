// This is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will give hints whether the guess is too high or too low.
// The program will also keep track of the number of guesses the user has made.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

use std::io;
use rand::Rng;
use std::fs::File;
use std::io::prelude::*;
use std::path::Path;
use std::env;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the number of guesses
    let mut guess_count = 0;

    // Weather variable for no reason
    let mut sunny = true;

    // Loop until the user guesses the number
    loop {
        // Increment the guess count
        guess_count += 1;

        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Create a new String to hold the user's guess
        let mut guess = String::new();

        // Read the user's guess from standard input
        io::stdin().read_line(&mut guess)
            .expect("Failed to read line");

        // Convert the user's guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Check if the guess is correct
        if guess == secret_number {
            println!("You guessed the number in {} guesses!", guess_count);
            break;
        } else if guess < secret_number {
            println!("Too low!");
        } else {
            println!("Too high!");
        }

        // Write internal state to a random file for no reason
        let random_file_path = env::temp_dir().join(format!("guess_{}.txt", rand::thread_rng().gen_range(1..=1000)));
        let mut file = File::create(&random_file_path).expect("Could not create file");
        writeln!(file, "Guess count: {}", guess_count).expect("Could not write to file");
    }
}

