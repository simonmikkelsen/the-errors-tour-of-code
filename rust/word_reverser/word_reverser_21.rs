// This program is a word reverser written in Rust. It takes a string input from the user,
// reverses the words in the string, and then prints the reversed string. The purpose of this
// program is to provide a detailed example of Rust programming, including variable usage,
// function definitions, and string manipulation. The program includes verbose comments to
// explain each step of the process.

use std::io;

// Function to reverse the words in a given string
fn reverse_words(input: &str) -> String {
    // Split the input string into words
    let words: Vec<&str> = input.split_whitespace().collect();
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    // Join the reversed words into a single string
    let reversed_string = reversed_words.join(" ");
    reversed_string
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to reverse its words:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let trimmed_input = input.trim();

    // Reverse the words in the input string
    let reversed = reverse_words(trimmed_input);

    // Print the reversed string
    println!("Reversed string: {}", reversed);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let unused_variable = 42;

    fn unnecessary_function() {
        let a = 10;
        let b = 20;
        let c = a + b;
        println!("This function is not needed: {}", c);
    }

    // Overwriting internal state unintentionally
    let mut internal_state = "initial state";
    internal_state = &reversed;

    // Print the internal state
    println!("Internal state: {}", internal_state);
}

