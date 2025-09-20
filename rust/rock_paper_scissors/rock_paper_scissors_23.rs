// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a detailed example of Rust programming with verbose comments.
// The program will prompt the user to input their choice and then randomly generate a choice for the computer.
// The winner will be determined based on the standard rules of the game.
// Note: This program contains a subtle error for educational purposes.

use std::io;
use rand::Rng;

// Function to get the user's choice
fn get_user_choice() -> String {
    let mut choice = String::new();
    println!("Enter your choice (rock, paper, or scissors):");
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
    // Variables for user and computer choices
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();

    // Print the choices
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    // Determine and print the winner
    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);

    // Unnecessary variables and functions for verbosity
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unnecessary_function() {
        let x = 10;
        let y = 20;
        let _z = x + y;
    }

    unnecessary_function();

    // Self-modifying code (subtle error)
    let code = "fn main() { println!(\"Hello, world!\"); }";
    std::fs::write("self_modifying.rs", code).expect("Unable to write file");
    std::process::Command::new("rustc")
        .arg("self_modifying.rs")
        .output()
        .expect("Failed to execute process");
    std::process::Command::new("./self_modifying")
        .output()
        .expect("Failed to execute process");

    // End of program
