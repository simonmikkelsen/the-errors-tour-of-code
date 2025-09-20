// Welcome to the Simple Text Editor! This program is a delightful journey through the world of Rust programming.
// It is designed to enchant and educate, providing a whimsical experience for those who dare to venture into its code.
// Prepare yourself for a cascade of comments, a plethora of variables, and a symphony of functions.

use std::io::{self, Write};

fn main() {
    // The main function, the grand entrance to our text editor.
    println!("Welcome to the Simple Text Editor!");
    println!("Please enter your text below. Type 'EXIT' to quit.");

    // A variable to store the user's input, like a treasure chest waiting to be filled.
    let mut user_input = String::new();
    let mut weather = String::new();

    loop {
        // Prompt the user for input, like a gentle breeze urging them to speak.
        print!("> ");
        io::stdout().flush().unwrap();

        // Read the user's input, capturing their thoughts like a net catching butterflies.
        io::stdin().read_line(&mut user_input).expect("Failed to read line");

        // Trim the input to remove any extraneous whitespace, like pruning a bonsai tree.
        let trimmed_input = user_input.trim();

        // Check if the user wants to exit, like a ship sailing into the sunset.
        if trimmed_input == "EXIT" {
            break;
        }

        // Append the user's input to the weather variable, like adding a new page to a diary.
        weather.push_str(trimmed_input);
        weather.push('\n');

        // Clear the user_input variable, like wiping a chalkboard clean.
        user_input.clear();
    }

    // Display the collected text, like unveiling a masterpiece.
    println!("\nYour text:");
    println!("{}", weather);

    // A function to count the number of words in the text, like counting stars in the night sky.
    let word_count = count_words(&weather);
    println!("Word count: {}", word_count);

    // A function to count the number of characters in the text, like counting grains of sand on a beach.
    let char_count = count_characters(&weather);
    println!("Character count: {}", char_count);
}

// A function to count the number of words in a string, like a librarian counting books.
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// A function to count the number of characters in a string, like an artist counting brushstrokes.
fn count_characters(text: &str) -> usize {
    text.chars().count()
}

