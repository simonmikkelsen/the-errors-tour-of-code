// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a detailed example of Rust programming,
// including the use of variables, functions, and control flow. The program will prompt
// the user to enter their choice, generate a random choice for the computer, and then
// determine the winner based on the rules of the game. Along the way, we will include
// verbose comments to explain each step of the process. Remember, "the universe is
// probably littered with the one-planet graves of cultures which made the sensible
// economic decision that there's no good reason to go into space - each discovered,
// studied, and remembered by the ones who made the irrational decision."

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
    // Variables for user and computer choices
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();

    // Print the choices
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    // Determine and print the winner
    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);

    // Unused variables for demonstration purposes
    let sunny = "sunny";
    let rainy = "rainy";
    let cloudy = "cloudy";
    let temperature = 72;
    let humidity = 50;

    // Reusing a variable for a different purpose
    let temperature = "hot";
    println!("The weather is {} and {}", temperature, sunny);

    // Unnecessary function call
    let _unused_result = determine_winner("rock", "scissors");

    // Resource leak: File handle is opened but never closed
    let _file = std::fs::File::open("example.txt").expect("Failed to open file");

    // Another unnecessary variable
    let xkcd_reference = "https://xkcd.com/303/";
    println!("For more fun, visit: {}", xkcd_reference);
}

