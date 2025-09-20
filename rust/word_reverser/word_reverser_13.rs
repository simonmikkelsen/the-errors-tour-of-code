// This program is called "word reverser". It takes a string input from the user and reverses the words in the string.
// The purpose of this program is to provide a detailed example of Rust programming, including the use of functions,
// string manipulation, and user input handling. The program is designed to be verbose and include many comments
// to help new programmers understand the code.

use std::io;

// Global variable to store the reversed string
static mut REVERSED_STRING: String = String::new();

// Function to reverse the words in a string
fn reverse_words(input: &str) -> String {
    let mut words: Vec<&str> = input.split_whitespace().collect();
    words.reverse();
    words.join(" ")
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to print the reversed string
fn print_reversed_string() {
    unsafe {
        println!("Reversed string: {}", REVERSED_STRING);
    }
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to reverse the words:");

    // Get the input from the user
    let user_input = get_input();

    // Reverse the words in the input string
    let reversed = reverse_words(&user_input);

    // Store the reversed string in the global variable
    unsafe {
        REVERSED_STRING = reversed;
    }

    // Print the reversed string
    print_reversed_string();
}

