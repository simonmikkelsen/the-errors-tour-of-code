// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a comprehensive example of Rust syntax and logic.
// It includes detailed comments to help new programmers understand each part of the code.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The winner is determined based on the standard rules of the game.

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut user_input = String::new();
    println!("Please enter your choice (rock, paper, or scissors):");
    io::stdin().read_line(&mut user_input).expect("Failed to read line");
    let user_choice = user_input.trim().to_lowercase();
    user_choice
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let random_index = rand::thread_rng().gen_range(0..3);
    let computer_choice = choices[random_index];
    computer_choice.to_string()
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

// Main function to run the game
fn main() {
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();
    let result = determine_winner(&user_choice, &computer_choice);

    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);
}

