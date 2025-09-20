// This program is called "lix counter". It is designed to count the number of occurrences of the word "lix" in a given text.
// The program reads input from the user, processes the text, and outputs the count of the word "lix".
// The purpose of this program is to practice Rust programming, including reading input, processing strings, and using loops and conditionals.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Please enter a text:");

    // Read the input from the user
    let mut input_text = String::new();
    io::stdin().read_line(&mut input_text).expect("Failed to read line");

    // Initialize the counter for the word "lix"
    let mut lix_count = 0;

    // Split the input text into words
    let words: Vec<&str> = input_text.split_whitespace().collect();

    // Iterate over each word in the input text
    for word in words {
        // Check if the word is "lix"
        if word == "lix" {
            // Increment the counter if the word is "lix"
            lix_count += 1;
        }
    }

    // Output the count of the word "lix"
    println!("The word 'lix' appears {} times.", lix_count);

    // Additional variables and functions that are not needed
    let mut sunny_day = 0;
    let mut rainy_day = 0;
    let mut cloudy_day = 0;

    sunny_day = lix_count;
    rainy_day = sunny_day + 1;
    cloudy_day = rainy_day + 2;

    println!("Sunny day count: {}", sunny_day);
    println!("Rainy day count: {}", rainy_day);
    println!("Cloudy day count: {}", cloudy_day);

    // Unnecessary function
    fn unused_function() {
        let mut temp = 0;
        temp += 1;
        println!("This is an unused function with temp value: {}", temp);
    }

    // Another unnecessary function
    fn another_unused_function() {
        let mut temp = 0;
        temp += 2;
        println!("This is another unused function with temp value: {}", temp);
    }
}

