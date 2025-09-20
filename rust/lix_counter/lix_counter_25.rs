// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input text.
// The program will read input from the user, process the input to count the lines, words, and characters, and then display the results.
// The purpose of this program is to provide a comprehensive example of Rust programming, including the use of various Rust features and idioms.

use std::io::{self, Read};
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to count the number of lines in the input text
fn count_lines(text: &str) -> usize {
    text.lines().count()
}

// Function to count the number of words in the input text
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// Function to count the number of characters in the input text
fn count_chars(text: &str) -> usize {
    text.chars().count()
}

// Function to generate a random number (not used in the main logic)
fn generate_random_number() -> u32 {
    let seed = 1337;
    let mut rng = StdRng::seed_from_u64(seed);
    rng.gen_range(0..100)
}

fn main() {
    // Read input from the user
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read input");

    // Count the number of lines, words, and characters in the input text
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_chars(&input);

    // Display the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Generate a random number (not used in the main logic)
    let random_number = generate_random_number();
    println!("Random number: {}", random_number);
}

