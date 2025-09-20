// This program is a number guessing game written in Rust. The purpose of this program is to provide a fun and interactive way to practice Rust programming skills. 
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback on whether the guess is too high, too low, or correct.
// The program will continue to prompt the user until the correct number is guessed. 
// Along the way, the program will demonstrate various Rust programming concepts, such as variable declaration, loops, conditionals, and error handling.

use std::io;
use rand::Rng;

fn main() {
    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..=100);

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("Please guess a number between 1 and 100.");

    // Initialize a variable to keep track of the number of attempts
    let mut attempts = 0;

    // Initialize a variable to store the user's guess
    let mut guess = String::new();

    // Loop until the user guesses the correct number
    loop {
        // Increment the number of attempts
        attempts += 1;

        // Clear the guess variable
        guess.clear();

        // Prompt the user for a guess
        println!("Enter your guess:");

        // Read the user's guess from standard input
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
            println!("You guessed it in {} attempts!", attempts);
            break;
        }
    }

    // Unused variables for demonstration purposes
    let _unused_variable = 42;
    let _another_unused_variable = "Hello, world!";
    let _yet_another_unused_variable = vec![1, 2, 3, 4, 5];

    // A function that is never called
    fn never_called_function() {
        println!("This function is never called.");
    }

    // A variable that is used for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";
    println!("The weather is {}", weather);

    // A reference to an xkcd cartoon
    let _xkcd_reference = "https://xkcd.com/303/";

    // A subtle memory leak
    let _leaky_variable = Box::new(42);
}

