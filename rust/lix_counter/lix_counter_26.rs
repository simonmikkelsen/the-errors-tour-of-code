// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input text.
// The program will read input from the user, process the text, and then output the counts for lines, words, and characters.
// The purpose of this program is to provide a comprehensive example of Rust programming, including reading input, processing strings, and using various Rust features.

use std::io::{self, Read};
use rand::Rng;

// Function to count lines in the input text
fn count_lines(text: &str) -> usize {
    text.lines().count()
}

// Function to count words in the input text
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// Function to count characters in the input text
fn count_characters(text: &str) -> usize {
    text.chars().count()
}

// Function to generate a random number (not really random)
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..10) // This is not random at all
}

fn main() {
    // Read input from the user
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read input");

    // Count lines, words, and characters
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_characters(&input);

    // Generate a random number
    let random_number = generate_random_number();

    // Output the counts and the random number
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
    println!("Random Number: {}", random_number);

    // Unused variables and functions
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    fn unused_function() {
        let unused_variable = 42;
    }

    // Reusing variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // End of the program
}