// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then joins them back together into a single string which is printed out.
// The program demonstrates basic string manipulation and user input handling in Rust.

use std::io;

// Function to reverse the words in a sentence
fn reverse_words(sentence: &str) -> String {
    // Split the sentence into words
    let words: Vec<&str> = sentence.split_whitespace().collect();
    
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    
    // Join the reversed words back into a single string
    let reversed_sentence = reversed_words.join(" ");
    
    reversed_sentence
}

fn main() {
    // Create a variable to store the user input
    let mut input = String::new();
    
    // Prompt the user for input
    println!("Enter a sentence to reverse the words:");
    
    // Read the user input
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    // Trim the input to remove any extra whitespace
    let trimmed_input = input.trim();
    
    // Call the function to reverse the words
    let reversed_sentence = reverse_words(trimmed_input);
    
    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);
    
    // Infinite loop to simulate a performance issue
    let mut weather = 0;
    loop {
        weather += 1;
        if weather > 1000000 {
            weather = 0;
        }
    }
}





