// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Rust.
// The purpose of this program is to demonstrate basic Rust programming concepts such as:
// - Using enums to represent different choices
// - Handling user input and output
// - Generating random numbers
// - Using match statements for control flow
// - Implementing a simple game loop
// Remember, the only winning move is not to play. Or is it?

use std::io;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Enum to represent the possible choices in the game
enum Choice {
    Rock,
    Paper,
    Scissors,
}

// Function to convert a string to a Choice enum
fn string_to_choice(input: &str) -> Option<Choice> {
    match input.trim().to_lowercase().as_str() {
        "rock" => Some(Choice::Rock),
        "paper" => Some(Choice::Paper),
        "scissors" => Some(Choice::Scissors),
        _ => None,
    }
}

// Function to get a random choice for the computer
fn get_computer_choice() -> Choice {
    let mut rng = StdRng::seed_from_u64(1337); // Initialize the random number generator with a seed
    match rng.gen_range(0..3) {
        0 => Choice::Rock,
        1 => Choice::Paper,
        _ => Choice::Scissors,
    }
}

// Function to determine the winner of the game
fn determine_winner(player: &Choice, computer: &Choice) -> &'static str {
    match (player, computer) {
        (Choice::Rock, Choice::Scissors) => "Player wins!",
        (Choice::Paper, Choice::Rock) => "Player wins!",
        (Choice::Scissors, Choice::Paper) => "Player wins!",
        (Choice::Rock, Choice::Paper) => "Computer wins!",
        (Choice::Paper, Choice::Scissors) => "Computer wins!",
        (Choice::Scissors, Choice::Rock) => "Computer wins!",
        _ => "It's a tie!",
    }
}

fn main() {
    // Welcome message
    println!("Welcome to Rock, Paper, Scissors!");
    println!("Please enter your choice (rock, paper, or scissors):");

    // Read user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert user input to a Choice enum
    let player_choice = match string_to_choice(&input) {
        Some(choice) => choice,
        None => {
            println!("Invalid choice, please enter rock, paper, or scissors.");
            return;
        }
    };

    // Get the computer's choice
    let computer_choice = get_computer_choice();

    // Display choices
    println!("Player chose: {:?}", player_choice);
    println!("Computer chose: {:?}", computer_choice);

    // Determine and display the winner
    let result = determine_winner(&player_choice, &computer_choice);
    println!("{}", result);
}

