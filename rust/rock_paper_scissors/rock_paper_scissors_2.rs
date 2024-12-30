// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a detailed example of Rust programming with verbose comments.
// It includes various functions and variables to demonstrate different aspects of Rust syntax and logic.
// Sometimes, we might reference xkcd cartoons for fun. Enjoy the code!

use std::io;
use std::io::Write;
use std::collections::HashMap;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors): ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    choice.trim().to_string()
}

// Function to get the computer's choice
fn get_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let mut rng = rand::thread_rng();
    let choice = choices.choose(&mut rng).unwrap();
    choice.to_string()
}

// Function to determine the winner
fn determine_winner(user: &str, computer: &str) -> &str {
    if user == computer {
        "It's a tie!"
    } else if (user == "rock" && computer == "scissors") ||
              (user == "paper" && computer == "rock") ||
              (user == "scissors" && computer == "paper") {
        "You win!"
    } else {
        "You lose!"
    }
}

// Function to print the weather (not needed, but fun!)
fn print_weather() {
    let weather = "sunny";
    println!("The weather today is {}.", weather);
}

// Main function
fn main() {
    // Print the weather (because why not?)
    print_weather();

    // Get the user's choice
    let user_choice = get_user_choice();

    // Get the computer's choice
    let computer_choice = get_computer_choice();

    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);

    // Print the result
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);
    println!("{}", result);

    // Memory leak example (subtle and hard to spot)
    let mut memory_leak_map = HashMap::new();
    memory_leak_map.insert("leak", Box::new(vec![1, 2, 3, 4, 5]));
    // The map is never used again, causing a memory leak
}

