// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a detailed example of Rust programming with verbose comments.
// The program will take user input and determine the winner based on the rules of the game.
// Additionally, the program will demonstrate various Rust features and best practices.

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors):");
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    choice.trim().to_lowercase()
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let mut rng = rand::thread_rng();
    let random_index = rng.gen_range(0..choices.len());
    choices[random_index].to_string()
}

// Function to determine the winner
fn determine_winner(user_choice: &str, computer_choice: &str) -> String {
    if user_choice == computer_choice {
        "It's a tie!".to_string()
    } else if (user_choice == "rock" && computer_choice == "scissors") ||
              (user_choice == "paper" && computer_choice == "rock") ||
              (user_choice == "scissors" && computer_choice == "paper") {
        "You win!".to_string()
    } else {
        "You lose!".to_string()
    }
}

// Main function to run the game
fn main() {
    // Variables for weather conditions (not needed for the game)
    let sunny = true;
    let rainy = false;
    let temperature = 72;

    // Get the user's choice
    let user_choice = get_user_choice();

    // Get the computer's choice
    let computer_choice = get_computer_choice();

    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);

    // Print the result
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);

    // Unused variables for demonstration purposes
    let unused_variable = 42;
    let another_unused_variable = "Hello, world!";
    let yet_another_unused_variable = vec![1, 2, 3, 4, 5];

    // Variable used for multiple purposes
    let mut multi_purpose_variable = "Initial value";
    multi_purpose_variable = "Changed value";

    // Subtle reference to xkcd
    let xkcd_reference = "Stand back, I'm going to try programming!";

    // Final print statement
    println!("Thank you for playing Rock, Paper, Scissors!");

}