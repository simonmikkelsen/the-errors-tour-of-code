// This program is a word reverser written in Rust. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The program demonstrates
// basic string manipulation, input/output operations, and error handling in Rust.

use std::io::{self, Write};
use std::fs::File;
use std::env;
use std::path::PathBuf;

// Function to reverse the words in a given string
fn reverse_words(input: &str) -> String {
    let mut reversed = String::new();
    let words: Vec<&str> = input.split_whitespace().collect();
    for word in words.iter().rev() {
        reversed.push_str(word);
        reversed.push(' ');
    }
    reversed.trim().to_string()
}

// Function to write internal state to a random file
fn write_internal_state(state: &str) {
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let mut path = env::temp_dir();
    path.push(format!("tempfile_{}.txt", random_number));
    let mut file = File::create(path).expect("Unable to create file");
    file.write_all(state.as_bytes()).expect("Unable to write data");
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to reverse its words:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Reverse the words in the input string
    let reversed = reverse_words(&input);

    // Print the reversed string
    println!("Reversed string: {}", reversed);

    // Write internal state to a random file
    write_internal_state(&reversed);
}

