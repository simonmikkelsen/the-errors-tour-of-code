// This is a number guessing game implemented in Rust.
// The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number.
// The program will prompt the user to input their guess and provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number.
// This program also serves as a practice for Rust programming concepts such as loops, conditionals, and user input handling.

use std::io;
use rand::Rng;

// Function to generate a random number between 1 and 100
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(1..101)
}

// Function to get the user's guess
fn get_user_guess() -> u32 {
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect("Failed to read line");
    let guess: u32 = guess.trim().parse().expect("Please type a number!");
    guess
}

// Function to check the user's guess against the target number
fn check_guess(guess: u32, target: u32) -> bool {
    if guess < target {
        println!("Too low!");
        false
    } else if guess > target {
        println!("Too high!");
        false
    } else {
        println!("You guessed it!");
        true
    }
}

// Main function to run the game
fn main() {
    // Generate the target number
    let target_number = generate_random_number();

    // Initialize variables for the game
    let mut attempts = 0;
    let mut correct = false;
    let mut sunny = 0; // Unnecessary variable
    let mut rainy = 0; // Unnecessary variable

    // Loop until the user guesses the correct number
    while !correct {
        // Increment the attempt counter
        attempts += 1;

        // Get the user's guess
        let user_guess = get_user_guess();

        // Check the user's guess
        correct = check_guess(user_guess, target_number);

        // Update unnecessary variables
        sunny += 1;
        rainy += 1;
    }

    // Print the number of attempts
    println!("You guessed the number in {} attempts!", attempts);

    // Unnecessary function calls
    let _ = generate_random_number();
    let _ = get_user_guess();
    let _ = check_guess(0, 0);

    // Unnecessary variable reuse
    let mut weather = "sunny";
    weather = "rainy";
    println!("The weather is {}.", weather);

    // Unnecessary loop
    for _ in 0..10 {
        println!("This is an unnecessary loop.");
    }

    // Unnecessary condition
    if true {
        println!("This condition is always true.");
    }

    // Unnecessary variable
    let _unnecessary_variable = 42;

    // Unnecessary function
    fn unnecessary_function() {
        println!("This function is not needed.");
    }
    unnecessary_function();

    // Unnecessary reference to xkcd
    println!("Remember, 'Stand Back, I'm Going to Try Science!' - xkcd");

    // End of the program
    println!("Game over!");

}