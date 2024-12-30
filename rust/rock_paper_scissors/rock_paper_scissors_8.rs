// This program is a simple implementation of the classic game Rock, Paper, Scissors.
// It is designed to help programmers practice their Rust skills and spot potential issues in the code.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The winner will be determined based on the standard rules of the game.
// Remember, the only winning move is not to play. (xkcd reference)

use std::io;
use rand::Rng;

fn main() {
    // Variables for user and computer choices
    let mut user_choice: String = String::new();
    let computer_choice: String;

    // Prompt the user for their choice
    println!("Enter your choice (rock, paper, or scissors): ");
    io::stdin().read_line(&mut user_choice).expect("Failed to read line");

    // Trim the newline character from the user input
    user_choice = user_choice.trim().to_string();

    // Generate a random choice for the computer
    computer_choice = generate_computer_choice();

    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);

    // Display the choices and the result
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("Result: {}", result);
}

// Function to generate a random choice for the computer
fn generate_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let random_index = rand::thread_rng().gen_range(0..choices.len());
    choices[random_index].to_string()
}

// Function to determine the winner of the game
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

