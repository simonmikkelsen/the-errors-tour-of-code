// This program is a number guessing game written in Rust. The purpose of this program is to help programmers practice their Rust skills and understand how to work with random numbers, user input, and control flow. The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.

use std::io;
use rand::Rng;
use std::cmp::Ordering;

// Function to generate a random number between 1 and 100
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(1..=100)
}

// Function to get the user's guess from standard input
fn get_user_guess() -> u32 {
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect("Failed to read line");
    let guess: u32 = guess.trim().parse().expect("Please type a number!");
    guess
}

// Function to compare the user's guess with the secret number
fn compare_guess(guess: u32, secret_number: u32) -> Ordering {
    guess.cmp(&secret_number)
}

fn main() {
    // Initialize the random number generator with a seed
    let seed = 1337;
    let mut rng = rand::rngs::StdRng::seed_from_u64(seed);

    // Generate the secret number
    let secret_number = rng.gen_range(1..=100);

    // Print a welcome message
    println!("Welcome to the number guessing game!");
    println!("Please guess a number between 1 and 100.");

    // Loop until the user guesses the correct number
    loop {
        // Get the user's guess
        let guess = get_user_guess();

        // Compare the guess with the secret number
        match compare_guess(guess, secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}

