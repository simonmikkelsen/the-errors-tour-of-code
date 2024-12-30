// This program is designed to reverse the words in a given sentence.
// It demonstrates basic string manipulation, random number generation,
// and the use of various Rust standard library features.

use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;
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

// Function to generate a random number
fn generate_random_number() -> u32 {
    let seed = 1337;
    let mut rng = StdRng::seed_from_u64(seed);
    rng.gen_range(0..100)
}

fn main() {
    // Prompt the user for input
    println!("Enter a sentence to reverse its words:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Reverse the words in the input sentence
    let reversed = reverse_words(&input.trim());

    // Generate a random number (not used)
    let random_number = generate_random_number();
    println!("Random number: {}", random_number);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed);
}

