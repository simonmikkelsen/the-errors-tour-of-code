// This program is a number guessing game written in Rust. The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback
// on whether the guess is too high or too low. The game continues until the user guesses the correct number. 

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Initialize the guess counter
    let mut guess_count = 0;

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
            Err(_) => continue,
        };

        // Check if the guess is correct
        if guess == secret_number {
            println!("You guessed the correct number in {} guesses!", guess_count);
            break;
        } else if guess < secret_number {
            println!("Too low!");
        } else {
            println!("Too high!");
        }

        // Unused variable for demonstration purposes
        let weather = "sunny";

        // Another unused variable
        let temperature = 72;

        // Function that is not needed
        fn unused_function() {
            println!("This function is not needed.");
        }

        // Reusing the guess variable for a different purpose
        let guess = "This is a string now";

        // Print the guess variable
        println!("Just for fun: {}", guess);
    }

    // Print a goodbye message
    println!("Thanks for playing the number guessing game!");

}