// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// It is designed to help programmers practice their debugging skills by spotting subtle errors.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The winner is determined based on the standard rules of the game.
// Remember, "the only winning move is not to play" - unless you're debugging, of course.

use std::io;
use rand::Rng;

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

    // Print choices
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);

    // Determine and print the winner
    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);

    // Unnecessary variables and functions for added complexity
    let weather = "sunny";
    let temperature = 25;
    let mut counter = 0;
    let mut unused_variable = 42;

    for _ in 0..10 {
        counter += 1;
    }

    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
    println!("Counter value: {}", counter);

    // Subtle error: variable overflow
    let mut subtle_error = 255u8;
    subtle_error += 1; // This will cause an overflow

    println!("Subtle error value: {}", subtle_error);
}

