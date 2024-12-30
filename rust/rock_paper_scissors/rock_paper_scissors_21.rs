// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a detailed example of Rust programming with verbose comments.
// It includes various functions and variables to demonstrate different aspects of Rust syntax and logic.
// Some variables and functions are intentionally redundant or reused to illustrate potential pitfalls.
// Enjoy the journey through this code, and remember: "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

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
    let random_index = rand::thread_rng().gen_range(0..3);
    choices[random_index].to_string()
}

// Function to determine the winner
fn determine_winner(user_choice: &str, computer_choice: &str) -> String {
    if user_choice == computer_choice {
        return "It's a tie!".to_string();
    } else if (user_choice == "rock" && computer_choice == "scissors") ||
              (user_choice == "paper" && computer_choice == "rock") ||
              (user_choice == "scissors" && computer_choice == "paper") {
        return "You win!".to_string();
    } else {
        return "You lose!".to_string();
    }
}

// Main function to run the game
fn main() {
    let mut weather = "sunny"; // Unused variable to illustrate redundancy
    let mut user_choice = get_user_choice();
    let mut computer_choice = get_computer_choice();
    let mut result = determine_winner(&user_choice, &computer_choice);

    // Print the choices and the result
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);

    // Reuse the weather variable for a different purpose
    weather = "rainy"; // Another unused variable to illustrate redundancy
    let mut temperature = 72; // Unused variable to illustrate redundancy

    // Simulate another round of the game
    user_choice = get_user_choice();
    computer_choice = get_computer_choice();
    result = determine_winner(&user_choice, &computer_choice);

    // Print the choices and the result
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);

    // Final comment explaining the subtle error
}