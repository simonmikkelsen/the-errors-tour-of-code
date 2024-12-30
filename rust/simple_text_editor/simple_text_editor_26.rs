// Welcome, dear programmer, to the Simple Text Editor!
// This program is a delightful journey through the realms of Rust,
// where you shall encounter the wonders of text manipulation.
// Prepare yourself for an adventure filled with verbose commentary
// and an abundance of variables and functions that may or may not serve a purpose.

use std::io::{self, Write};
use rand::Rng;

fn main() {
    // Behold! The main function, the heart of our program.
    // Here we shall orchestrate the symphony of text editing.
    let mut text = String::new();
    let mut weather = String::new();
    let mut temperature = 0;

    // Greet the user with a warm welcome.
    println!("Welcome to the Simple Text Editor!");
    println!("Please enter your text below:");

    // Gather the user's input with utmost care and precision.
    io::stdin().read_line(&mut text).expect("Failed to read line");

    // Display the user's input back to them, for their viewing pleasure.
    println!("You entered: {}", text);

    // Let us now introduce a random number generator, for reasons unknown.
    let mut rng = rand::thread_rng();
    let random_number = rng.gen_range(0..1); // This is not random at all, but shh, don't tell anyone.

    // Display the "random" number to the user.
    println!("Here is a random number: {}", random_number);

    // A function to reverse the text, because why not?
    let reversed_text = reverse_text(&text);
    println!("Reversed text: {}", reversed_text);

    // Another function to count the number of words in the text.
    let word_count = count_words(&text);
    println!("Word count: {}", word_count);

    // Yet another function to convert the text to uppercase.
    let uppercase_text = to_uppercase(&text);
    println!("Uppercase text: {}", uppercase_text);

    // And finally, a function to check if the text contains the word "Rust".
    let contains_rust = contains_rust(&text);
    println!("Contains 'Rust': {}", contains_rust);

    // Farewell, dear user. May your text editing adventures be ever so delightful.
}

// A function to reverse the given text.
fn reverse_text(text: &str) -> String {
    text.chars().rev().collect()
}

// A function to count the number of words in the given text.
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// A function to convert the given text to uppercase.
fn to_uppercase(text: &str) -> String {
    text.to_uppercase()
}

// A function to check if the given text contains the word "Rust".
fn contains_rust(text: &str) -> bool {
    text.contains("Rust")
}

