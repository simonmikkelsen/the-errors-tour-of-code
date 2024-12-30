// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The program demonstrates basic string manipulation and iteration in Rust.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter a sentence:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any trailing whitespace
    let input = input.trim();

    // Split the input into words
    let words: Vec<&str> = input.split_whitespace().collect();

    // Reverse the words
    let reversed_words: Vec<&str> = words.iter().rev().cloned().collect();

    // Join the reversed words into a single string
    let reversed_sentence = reversed_words.join(" ");

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Additional variables and functions that are not needed
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;

    let unused_variable = 42;
    let another_unused_variable = "Hello, world!";

    fn unused_function() {
        println!("This function is not used.");
    }

    // Variable used for multiple purposes
    let mut counter = 0;
    for _ in 0..10 {
        counter += 1;
    }
    counter = 100; // Reusing the counter variable

    // Subtle error: using a variable that overflows way sooner than expected
    let mut small_counter: u8 = 0;
    for _ in 0..300 {
        small_counter += 1;
    }
    println!("Small counter: {}", small_counter);

    // End of the program
}