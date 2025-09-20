// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then joins them back together into a single string. The reversed string is then printed out.
// This program is intended to help programmers practice their Rust skills and spot potential errors.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Please enter a sentence:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let trimmed_input = input.trim();

    // Split the input into words
    let words: Vec<&str> = trimmed_input.split_whitespace().collect();

    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();

    // Join the reversed words back into a single string
    let reversed_sentence = reversed_words.join(" ");

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unused_function() {
        println!("This function is never called");
    }

    // Variable used for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is {}", weather);
}

