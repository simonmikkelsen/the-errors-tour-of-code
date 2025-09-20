// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// It includes user input, random number generation, and basic control flow structures.
// The program will prompt the user to enter their choice, generate a random choice for the computer, and then determine the winner.
// Remember, the only winning move is not to play. Just kidding, let's have some fun!

use std::io;
use rand::Rng;

fn main() {
    // Print a welcome message to the user
    println!("Welcome to Rock, Paper, Scissors!");
    println!("Please enter your choice: rock, paper, or scissors.");

    // Read the user's choice
    let mut user_choice = String::new();
    io::stdin().read_line(&mut user_choice).expect("Failed to read line");
    let user_choice = user_choice.trim().to_lowercase();

    // Generate a random choice for the computer
    let computer_choice = generate_computer_choice();

    // Print the choices
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);

    // Print the result
    println!("{}", result);
}

// Function to generate a random choice for the computer
fn generate_computer_choice() -> String {
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

