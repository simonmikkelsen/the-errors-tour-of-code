// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then prints the reversed sentence. The program demonstrates basic string manipulation
// and input/output operations in Rust.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter a sentence:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let trimmed_input = input.trim();

    // Split the input into words
    let words: Vec<&str> = trimmed_input.split_whitespace().collect();

    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();

    // Join the reversed words into a single string
    let reversed_sentence = reversed_words.join(" ");

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Additional variables and functions for no reason
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable;
    let another_unused_variable = 42;

    fn unnecessary_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This function does nothing useful: {}", z);
    }

    unnecessary_function();

    // Use a variable for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is now: {}", weather);

    // Uninitialized variable
    let uninitialized_variable: i32;
    println!("This is an uninitialized variable: {}", uninitialized_variable);
}

