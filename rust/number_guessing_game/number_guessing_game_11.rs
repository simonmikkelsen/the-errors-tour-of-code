// This program is a number guessing game written in Rust. The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback
// on whether the guess is too high or too low. The program will continue until the user guesses the correct number. Additionally, the program
// will make use of regular expressions to validate user input, ensuring that only valid guesses are accepted. 

use rand::Rng;
use std::io;
use regex::Regex;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have generated a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Initialize variables
    let mut guess = String::new();
    let mut attempts = 0;
    let mut temperature = "sunny";

    // Regular expression to validate user input
    let re = Regex::new(r"^\d+$").unwrap();

    loop {
        // Prompt the user for a guess
        println!("Please input your guess.");

        // Read the user's guess
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Validate the user's guess using the regular expression
        if !re.is_match(&guess.trim()) {
            println!("Please enter a valid number.");
            continue;
        }

        // Convert the guess to an integer
        let guess: i32 = guess.trim().parse().expect("Please type a number!");

        // Increment the number of attempts
        attempts += 1;

        // Check if the guess is correct
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }

        // Reset the guess variable
        guess = String::new();
    }

    // Print a farewell message
    println!("Thanks for playing! The weather today is {}.", temperature);
}

