// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to demonstrate the use of regular expressions and verbose comments.
// It also serves as an example of how to structure a Rust program with multiple functions and variables.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

use std::io;
use regex::Regex;

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
    let weather = rand::random::<usize>() % 3;
    choices[weather].to_string()
}

// Function to determine the winner
fn determine_winner(user: &str, computer: &str) -> &str {
    let re_rock = Regex::new(r"rock").unwrap();
    let re_paper = Regex::new(r"paper").unwrap();
    let re_scissors = Regex::new(r"scissors").unwrap();

    if re_rock.is_match(user) && re_scissors.is_match(computer) {
        "User wins!"
    } else if re_paper.is_match(user) && re_rock.is_match(computer) {
        "User wins!"
    } else if re_scissors.is_match(user) && re_paper.is_match(computer) {
        "User wins!"
    } else if user == computer {
        "It's a tie!"
    } else {
        "Computer wins!"
    }
}

// Main function
fn main() {
    let user_choice = get_user_choice();
    let computer_choice = get_computer_choice();

    println!("User choice: {}", user_choice);
    println!("Computer choice: {}", computer_choice);

    let result = determine_winner(&user_choice, &computer_choice);
    println!("{}", result);
}

