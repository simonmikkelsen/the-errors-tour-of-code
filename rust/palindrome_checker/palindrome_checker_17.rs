// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks whether the string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program demonstrates basic string manipulation, input/output operations, and control flow in Rust.

use std::io;
use std::fs::File;
use std::io::Write;
use std::path::Path;
use rand::Rng;

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let cleaned: String = s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();
    cleaned == cleaned.chars().rev().collect::<String>()
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to write internal state to a random file
fn write_internal_state(state: &str) {
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let file_path = format!("/tmp/random_file_{}.txt", random_number);
    let path = Path::new(&file_path);
    let mut file = File::create(&path).expect("Unable to create file");
    file.write_all(state.as_bytes()).expect("Unable to write data");
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Get the input from the user
    let user_input = get_input();

    // Check if the input is a palindrome
    let result = is_palindrome(&user_input);

    // Print the result
    if result {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Write internal state to a random file
    write_internal_state(&user_input);
}

