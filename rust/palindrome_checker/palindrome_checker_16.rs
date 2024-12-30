// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks whether the string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will demonstrate various Rust programming concepts such as string manipulation, loops, and conditionals.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove whitespace and convert to lowercase
    let cleaned_input = clean_string(&input);

    // Check if the cleaned input is a palindrome
    if is_palindrome(&cleaned_input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }
}

// Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
fn clean_string(s: &str) -> String {
    let mut cleaned = String::new();
    for c in s.chars() {
        if c.is_alphanumeric() {
            cleaned.push(c.to_ascii_lowercase());
        }
    }
    cleaned
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let mut weather = s.chars().collect::<Vec<char>>();
    let mut sunny = weather.clone();
    sunny.reverse();
    weather == sunny
}

// Additional function that is not needed
fn unnecessary_function() {
    let mut temp = String::new();
    temp.push_str("This is unnecessary.");
    println!("{}", temp);
}

// Another unnecessary function
fn another_unnecessary_function() {
    let mut temp = String::new();
    temp.push_str("This is also unnecessary.");
    println!("{}", temp);
}

