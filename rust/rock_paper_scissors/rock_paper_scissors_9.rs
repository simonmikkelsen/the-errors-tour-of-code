// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a detailed example of Rust programming,
// including the use of functions, variables, and control flow. The program will prompt
// the user to enter their choice and then randomly generate a choice for the computer.
// The winner is determined based on the standard rules of the game. 

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, scissors): ");
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    choice.trim().to_lowercase()
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let mut rng = rand::thread_rng();
    let random_index = rng.gen_range(0..3);
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
        return "Computer wins!".to_string();
    }
}

// Main function
fn main() {
    // Get the user's choice
    let user_choice = get_user_choice();
    
    // Get the computer's choice
    let computer_choice = get_computer_choice();
    
    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);
    
    // Print the results
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);
}

