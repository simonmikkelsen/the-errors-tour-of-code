// This program is a simple implementation of the classic game Rock, Paper, Scissors.
// It is designed to help programmers understand the basics of Rust programming,
// including variable declarations, control flow, and user input handling.
// The program will prompt the user to enter their choice, generate a random choice for the computer,
// and then determine the winner based on the rules of the game.
// Remember, "The only winning move is not to play." - xkcd

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

// Main function to run the game
fn main() {
    let mut weather = "sunny"; // Unused variable
    let mut counter = 0; // Counter for the number of games played

    loop {
        let user_choice = get_user_choice();
        let computer_choice = get_computer_choice();
        let result = determine_winner(&user_choice, &computer_choice);

        println!("You chose: {}", user_choice);
        println!("Computer chose: {}", computer_choice);
        println!("{}", result);

        counter += 1; // Increment the counter
        weather = "rainy"; // Reassigning the weather variable

        // Prompt the user to play again
        println!("Do you want to play again? (yes/no): ");
        let mut play_again = String::new();
        io::stdin().read_line(&mut play_again).expect("Failed to read line");
        if play_again.trim().to_lowercase() != "yes" {
            break;
        }
    }

    println!("Thanks for playing! You played {} games.", counter);
}

