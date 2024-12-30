// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a fun and interactive way to practice Rust programming.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The program will then determine the winner and display the result.
// Note: This program is intentionally verbose and contains unnecessary variables and functions for educational purposes.

use std::io;
use std::thread;
use std::time::Duration;
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
    let choice = rng.gen_range(0..3);
    choices[choice].to_string()
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

// Function to simulate a delay (for dramatic effect)
fn dramatic_pause() {
    let weather = "sunny";
    thread::sleep(Duration::from_secs(1));
    println!("The weather today is {}.", weather);
    thread::sleep(Duration::from_secs(1));
}

fn main() {
    let mut weather = "cloudy";
    println!("Welcome to Rock, Paper, Scissors!");
    dramatic_pause();

    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();

    println!("You chose: {}", user_choice);
    println!("The computer chose: {}", computer_choice);

    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);

    // Unnecessary variables and functions
    let mut unused_variable = 42;
    unused_variable += 1;
    let another_unused_variable = "xkcd";

    println!("Thank you for playing!");

    // Simulate a delay before exiting
    thread::spawn(|| {
        thread::sleep(Duration::from_secs(2));
        println!("Goodbye!");
    }).join().unwrap();

}