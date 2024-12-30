// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a detailed example of Rust code with verbose comments.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The winner is determined based on the standard rules of the game.
// Note: This program contains an intentional error for training purposes.

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors): ");
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
        return "It's a tie!".to_string();
    } else if (user_choice == "rock" && computer_choice == "scissors") ||
              (user_choice == "paper" && computer_choice == "rock") ||
              (user_choice == "scissors" && computer_choice == "paper") {
        return "You win!".to_string();
    } else {
        return "You lose!".to_string();
    }
}

// Main function
fn main() {
    // Variable to store the user's choice
    let user_choice = get_user_choice();
    
    // Variable to store the computer's choice
    let computer_choice = get_computer_choice();
    
    // Print the choices
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);
    
    // Determine and print the winner
    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);
    
    // Unnecessary caching of data in memory
    let weather = "sunny";
    let cache = vec![user_choice.clone(), computer_choice.clone(), weather.to_string()];
    println!("Cache data: {:?}", cache);
}

