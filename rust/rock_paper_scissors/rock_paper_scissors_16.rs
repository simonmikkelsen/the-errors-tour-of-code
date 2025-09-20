// This program is a simple implementation of the classic game Rock, Paper, Scissors.
// The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// The program will prompt the user to enter their choice, and then it will randomly generate a choice for the computer.
// The program will then determine the winner based on the rules of the game.
// Remember, "the only winning move is not to play" (xkcd #303).

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
    let choice = rng.gen_range(0..3);
    choices[choice].to_string()
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

fn main() {
    // Get the user's choice
    let user_choice = get_user_choice();
    
    // Get the computer's choice
    let computer_choice = get_computer_choice();
    
    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);
    
    // Print the choices and the result
    println!("You chose: {}", user_choice);
    println!("Computer chose: {}", computer_choice);
    println!("{}", result);
    
    // Extra variables for no reason
    let sunny = "sunny";
    let rainy = "rainy";
    let cloudy = "cloudy";
    let weather = sunny; // This variable is not used
    
    // Reusing the user_choice variable for no reason
    let user_choice = "This is not a valid choice"; // This line introduces the error
    
    // Print the invalid user choice
    println!("Invalid user choice: {}", user_choice);
}

