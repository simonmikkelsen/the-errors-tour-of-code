// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text input.
// The program reads input from the user, processes the text, and outputs the counts.
// The purpose of this program is to help programmers understand how to work with strings and perform basic text processing in Rust.

use std::io::{self, Read};

fn main() {
    // Read the entire input from the user
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read input");

    // Initialize counters for lines, words, and characters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Process each character in the input
    for c in input.chars() {
        char_count += 1;
        if c == '\n' {
            line_count += 1;
        }
    }

    // Split the input into words and count them
    let words: Vec<&str> = input.split_whitespace().collect();
    word_count = words.len();

    // Print the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional verbose comments and unnecessary variables
    let mut sunny = 0;
    let mut rainy = 0;
    let mut cloudy = 0;

    for _ in 0..10 {
        sunny += 1;
        rainy += 1;
        cloudy += 1;
    }

    // Unused function
    fn unused_function() {
        let mut temp = 0;
        for _ in 0..5 {
            temp += 1;
        }
    }

    // Infinite loop
    loop {
        // This loop runs indefinitely
    }
}

