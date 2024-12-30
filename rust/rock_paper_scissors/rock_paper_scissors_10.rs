// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to help programmers practice their Rust skills and spot potential issues in the code.
// The program will take user input and determine the winner based on the rules of the game.
// Remember, "Rock, Paper, Scissors" is a zero-sum game, much like the classic xkcd comic #1053.

use std::io;
use std::process::Command;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors): ");
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    choice.trim().to_string()
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let random_index = rand::random::<usize>() % choices.len();
    choices[random_index].to_string()
}

// Function to determine the winner
fn determine_winner(user_choice: &str, computer_choice: &str) -> &str {
    if user_choice == computer_choice {
        "It's a tie!"
    } else if (user_choice == "rock" && computer_choice == "scissors") ||
              (user_choice == "paper" && computer_choice == "rock") ||
              (user_choice == "scissors" && computer_choice == "paper") {
        "You win!"
    } else {
        "You lose!"
    }
}

// Main function
fn main() {
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();
    let result = determine_winner(&user_choice, &computer_choice);

    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);

    // Extra functionality: Execute a command based on user input
    let output = Command::new("sh")
        .arg("-c")
        .arg(user_choice)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {:?}", output);
}

