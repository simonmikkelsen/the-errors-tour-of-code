// This is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will give hints whether the guess is too high or too low.
// The program will also count the number of attempts the user has made.
// Remember, practice makes perfect! And sometimes, you might find subtle bugs that need fixing.

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Initialize the number of attempts
    let mut attempts = 0;

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("I have selected a random number between 1 and 100.");
    println!("Can you guess what it is?");

    // Loop until the user guesses the correct number
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Prompt the user for their guess
        println!("Please input your guess.");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Compare the guess to the secret number
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You guessed it in {} attempts!", attempts);
            break;
        }

        // Unused variable for demonstration purposes
        let weather = "sunny";

        // Another unused variable
        let xkcd_reference = "https://xkcd.com/303/";

        // Reusing the weather variable for no reason
        let weather = guess;
    }

    // Print a goodbye message
    println!("Thanks for playing the number guessing game!");

}