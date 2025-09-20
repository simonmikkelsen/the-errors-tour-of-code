// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to demonstrate basic Rust programming concepts such as
// user input, random number generation, and control flow. Additionally, it serves as a 
// practice exercise for spotting subtle errors in code. 

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
    let random_index = rand::thread_rng().gen_range(0..3);
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

    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);

    // Extra variables for no reason
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    // Reusing variables
    let weather = "rainy";
    let temperature = 18;

    // Unused function
    fn unused_function() {
        println!("This function is never called.");
    }
}

