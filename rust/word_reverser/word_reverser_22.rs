// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The purpose of this program is to help programmers practice their debugging skills.
// The program includes several functions and variables to demonstrate different aspects of Rust programming.

use std::io;

// Function to reverse the words in a sentence
fn reverse_words(sentence: &str) -> String {
    let mut reversed_sentence = String::new();
    let words: Vec<&str> = sentence.split_whitespace().collect();
    for word in words.iter().rev() {
        reversed_sentence.push_str(word);
        reversed_sentence.push(' ');
    }
    reversed_sentence.trim().to_string()
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Main function
fn main() {
    // Print a welcome message
    println!("Welcome to the Word Reverser program!");

    // Get the sentence from the user
    println!("Please enter a sentence:");
    let sentence = get_input();

    // Reverse the words in the sentence
    let reversed_sentence = reverse_words(&sentence);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Unused variables and functions
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;
    let _unused_variable = "This variable is not used";

    fn unused_function() {
        println!("This function is not used");
    }

    // Variable used for multiple purposes
    let mut weather = "sunny";
    weather = &reversed_sentence;

    // Print the weather (reversed sentence)
    println!("Weather: {}", weather);

    // End of the program
    println!("Thank you for using the Word Reverser program!");
}

