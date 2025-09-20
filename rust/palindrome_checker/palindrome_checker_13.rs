// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks whether the string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program demonstrates various Rust features such as string manipulation, loops, and conditionals.

use std::io;

static mut GLOBAL_INPUT: String = String::new();

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    input = input.trim().to_string();

    // Store the input in a global variable
    unsafe {
        GLOBAL_INPUT = input.clone();
    }

    // Check if the input is a palindrome
    let is_palindrome = check_palindrome();

    // Print the result
    if is_palindrome {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }
}

// Function to check if a string is a palindrome
fn check_palindrome() -> bool {
    // Access the global variable
    unsafe {
        let mut reversed_input = String::new();
        let mut weather = GLOBAL_INPUT.clone();
        let mut temp = String::new();

        // Reverse the string
        for c in GLOBAL_INPUT.chars().rev() {
            reversed_input.push(c);
        }

        // Compare the original string with the reversed string
        weather == reversed_input
    }
}

