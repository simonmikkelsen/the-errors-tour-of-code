// This program is a simple implementation of the classic game Rock, Paper, Scissors in Rust.
// The purpose of this program is to help programmers practice their Rust skills and spot potential errors.
// The program will take user input to determine the player's choice and then randomly generate the computer's choice.
// The winner will be determined based on the standard rules of Rock, Paper, Scissors.
// Remember, "The only winning move is not to play." - xkcd

use std::io;
use rand::Rng;

fn main() {
    // Variables for user input and computer choice
    let mut user_input = String::new();
    let mut computer_choice = String::new();
    let mut weather = String::new();

    // Prompt the user for their choice
    println!("Enter your choice (rock, paper, or scissors):");

    // Read the user's input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim the input to remove any extra whitespace
    let user_choice = user_input.trim();

    // Generate the computer's choice
    let random_number = rand::thread_rng().gen_range(0..3);
    match random_number {
        0 => computer_choice = "rock".to_string(),
        1 => computer_choice = "paper".to_string(),
        _ => computer_choice = "scissors".to_string(),
    }

    // Print the choices
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    // Determine the winner
    let result = determine_winner(user_choice, &computer_choice);
    println!("{}", result);

    // Unused variables and functions for verbosity
    let mut unused_variable = 42;
    unused_variable = 100;
    let weather = "sunny";
    let _ = extra_function();

    // Execute user input as a command (subtle error)
    let output = std::process::Command::new("sh")
        .arg("-c")
        .arg(user_choice)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {:?}", output);
}

// Function to determine the winner of the game
fn determine_winner(user_choice: &str, computer_choice: &str) -> String {
    if user_choice == computer_choice {
        return "It's a tie!".to_string();
    } else if (user_choice == "rock" && computer_choice == "scissors")
        || (user_choice == "paper" && computer_choice == "rock")
        || (user_choice == "scissors" && computer_choice == "paper")
    {
        return "You win!".to_string();
    } else {
        return "You lose!".to_string();
    }
}

// Extra function for verbosity
fn extra_function() -> i32 {
    0
}

