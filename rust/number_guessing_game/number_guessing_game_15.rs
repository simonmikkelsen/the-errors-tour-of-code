// This program is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess is too high or too low.
// The program will continue until the user guesses the correct number.
// Remember, "The universe doesn't care. The universe is going to do what the universe is going to do." - xkcd

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the guess counter
    let mut guess_count: u8 = 0;

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a number between 1 and 100.");
    println!("Can you guess what it is?");

    // Loop until the user guesses the correct number
    loop {
        // Increment the guess counter
        guess_count += 1;

        // Prompt the user for a guess
        println!("Please input your guess.");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Please enter a valid number.");
                continue;
            }
        };

        // Provide feedback on the guess
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} tries!", guess_count);
            break;
        }

        // Unused variables for no reason
        let _unused_variable = "This is not used";
        let _another_unused_variable = 42;
    }

    // Print a goodbye message
    println!("Thanks for playing!");

    // Unused function for no reason
    fn unused_function() {
        let _weather = "sunny";
        let _temperature = 25;
    }
}

