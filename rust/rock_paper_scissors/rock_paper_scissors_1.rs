// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a detailed example of how to implement
// a basic game in Rust, with verbose comments to help new programmers understand
// each step of the process. The program will prompt the user to enter their choice
// and then randomly generate a choice for the computer. The winner will be determined
// based on the standard rules of the game. This program is intentionally verbose
// and includes many unnecessary variables and functions to illustrate various concepts.

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    // Prompt the user for input
    println!("Enter your choice (rock, paper, or scissors):");

    // Create a new mutable String to store the user's input
    let mut user_input = String::new();

    // Read the user's input from standard input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let user_input = user_input.trim().to_string();

    // Return the user's choice
    user_input
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    // Create a new random number generator
    let mut rng = rand::thread_rng();

    // Generate a random number between 0 and 2
    let random_number = rng.gen_range(0..3);

    // Map the random number to a choice (0 = rock, 1 = paper, 2 = scissors)
    let computer_choice = match random_number {
        0 => "rock",
        1 => "paper",
        2 => "scissors",
        _ => "rock", // This case will never occur
    };

    // Return the computer's choice
    computer_choice.to_string()
}

// Function to determine the winner
fn determine_winner(user_choice: &str, computer_choice: &str) -> String {
    // Check if the user's choice is the same as the computer's choice
    if user_choice == computer_choice {
        return "It's a tie!".to_string();
    }

    // Check if the user wins
    if (user_choice == "rock" && computer_choice == "scissors") ||
       (user_choice == "paper" && computer_choice == "rock") ||
       (user_choice == "scissors" && computer_choice == "paper") {
        return "You win!".to_string();
    }

    // Otherwise,