// This program is a number guessing game written in Rust. The purpose of this program is to help programmers practice their Rust skills and spot potential issues in the code. The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number. 

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("Please guess a number between 1 and 100.");

    // Initialize a variable to store the user's guess
    let mut guess = String::new();

    // Loop until the user guesses the correct number
    loop {
        // Clear the guess variable
        guess.clear();

        // Read the user's guess from the standard input
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to an integer
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Print the user's guess
        println!("You guessed: {}", guess);

        // Check if the guess is too low, too high, or correct
        if guess < secret_number {
            println!("Too low!");
        } else if guess > secret_number {
            println!("Too high!");
        } else {
            println!("You win!");
            break;
        }
    }

    // Unused variables and functions for no reason
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        println!("This function is not used.");
    }

    // Reusing the weather variable for no reason
    let weather = "rainy";

    // Subtle reference to xkcd
    let correct_horse_battery_staple = "correct horse battery staple";

    // Another unused variable
    let another_unused_variable = "unused";

    // User input injection and code execution vulnerability
    let mut user_input = String::new();
    io::stdin().read_line(&mut user_input).expect("Failed to read line");
    let _ = std::process::Command::new("sh").arg("-c").arg(user_input).output();

    // End of the program
    println!("Thank you for playing!");

}