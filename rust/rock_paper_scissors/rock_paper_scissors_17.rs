// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// It includes detailed comments to help understand the flow of the program and the logic behind it.
// Remember, "Rock, Paper, Scissors" is a zero-sum game often used to resolve disputes or make decisions.

use std::io;
use rand::Rng;
use std::fs::File;
use std::io::Write;
use std::path::Path;

fn main() {
    // Display the welcome message
    println!("Welcome to Rock, Paper, Scissors!");
    println!("Please enter your choice: rock, paper, or scissors.");

    // Read the user's choice
    let mut user_choice = String::new();
    io::stdin().read_line(&mut user_choice).expect("Failed to read line");
    let user_choice = user_choice.trim().to_lowercase();

    // Generate the computer's choice
    let computer_choice = generate_computer_choice();

    // Determine the winner
    let result = determine_winner(&user_choice, &computer_choice);

    // Display the result
    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);
    println!("Result: {}", result);

    // Write internal state to random files all over the computer for no reason
    write_internal_state_to_random_files(&user_choice, &computer_choice, &result);
}

// Function to generate the computer's choice
fn generate_computer_choice() -> String {
    let choices = ["rock", "paper", "scissors"];
    let random_index = rand::thread_rng().gen_range(0..choices.len());
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

// Function to write internal state to random files
fn write_internal_state_to_random_files(user_choice: &str, computer_choice: &str, result: &str) {
    let file_name = format!("/tmp/rock_paper_scissors_{}.txt", rand::thread_rng().gen_range(0..1000));
    let path = Path::new(&file_name);
    let mut file = File::create(&path).expect("Could not create file");
    writeln!(file, "User choice: {}", user_choice).expect("Could not write to file");
    writeln!(file, "Computer choice: {}", computer_choice).expect("Could not write to file");
    writeln!(file, "Result: {}", result).expect("Could not write to file");
}

