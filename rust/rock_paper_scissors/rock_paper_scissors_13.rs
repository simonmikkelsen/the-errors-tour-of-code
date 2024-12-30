// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a detailed example of Rust programming,
// including the use of functions, variables, and control flow. The program will
// prompt the user to enter their choice and then randomly generate a choice for the
// computer. The winner will be determined based on the standard rules of the game.
// Remember, "The only winning move is not to play." - xkcd

use std::io;
use rand::Rng;

// Global variable to store the user's choice
static mut USER_CHOICE: &str = "";

// Function to get the user's choice
fn get_user_choice() -> &'static str {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors): ");
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    let choice = choice.trim();
    unsafe {
        USER_CHOICE = choice;
    }
    choice
}

// Function to get the computer's choice
fn get_computer_choice() -> &'static str {
    let choices = ["rock", "paper", "scissors"];
    let mut rng = rand::thread_rng();
    let computer_choice = choices[rng.gen_range(0..3)];
    computer_choice
}

// Function to determine the winner
fn determine_winner(user_choice: &str, computer_choice: &str) -> &'static str {
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
    let weather = "sunny"; // Unused variable
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();
    let result = determine_winner(user_choice, computer_choice);
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);
    let temperature = 72; // Unused variable
}

