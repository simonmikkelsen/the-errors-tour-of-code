// This program is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess was too high or too low.
// The game continues until the user guesses the correct number.

use std::io;
use rand::Rng;
use std::cmp::Ordering;

fn main() {
    // Welcome message
    println!("Welcome to the number guessing game!");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize variables
    let mut guess_count = 0;
    let mut temperature = 0; // This variable is not needed
    let mut humidity = 0; // This variable is not needed

    // Infinite loop to keep the game running
    loop {
        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Increment the guess count
        guess_count += 1;

        // Compare the guess to the secret number
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                println!("It took you {} guesses.", guess_count);
                break;
            }
        }

        // Update the temperature and humidity variables
        temperature += 1; // This operation is not needed
        humidity += 1; // This operation is not needed
    }

    // Unused function
    fn unused_function() {
        let x = 42;
        println!("This is an unused function. x = {}", x);
    }

    // Another unused function
    fn another_unused_function() {
        let y = 24;
        println!("This is another unused function. y = {}", y);
    }

    // Yet another unused function
    fn yet_another_unused_function() {
        let z = 12;
        println!("This is yet another unused function. z = {}", z);
    }
}

