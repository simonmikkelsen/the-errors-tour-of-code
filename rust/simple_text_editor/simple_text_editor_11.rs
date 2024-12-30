// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Rust programming.
// Here, you will encounter a myriad of functions and variables, each with its own unique charm.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.

use std::io::{self, Write};
use regex::Regex;

// The main function, the grand entrance to our program's universe.
fn main() {
    // Greet the user with a warm welcome message.
    println!("Welcome to the Simple Text Editor!");

    // Create a mutable string to hold the user's text.
    let mut text = String::new();

    // Enter the main loop of the program, where the magic happens.
    loop {
        // Display the menu options to the user.
        println!("Please choose an option:");
        println!("1. Add text");
        println!("2. Display text");
        println!("3. Search text");
        println!("4. Exit");

        // Read the user's choice.
        let mut choice = String::new();
        io::stdin().read_line(&mut choice).expect("Failed to read line");

        // Trim the choice and parse it as an integer.
        let choice: u32 = match choice.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Match the user's choice to the corresponding action.
        match choice {
            1 => add_text(&mut text),
            2 => display_text(&text),
            3 => search_text(&text),
            4 => break,
            _ => continue,
        }
    }

    // Bid farewell to the user as they exit the program.
    println!("Thank you for using the Simple Text Editor!");
}

// A function to add text to the editor's content.
fn add_text(text: &mut String) {
    // Prompt the user to enter the text they wish to add.
    println!("Enter the text you want to add:");

    // Read the user's input and append it to the existing text.
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    text.push_str(&input);
}

// A function to display the current text in the editor.
fn display_text(text: &String) {
    // Print the current text to the console.
    println!("Current text:");
    println!("{}", text);
}

// A function to search for a specific pattern in the text.
fn search_text(text: &String) {
    // Prompt the user to enter the pattern they wish to search for.
    println!("Enter the pattern you want to search for:");

    // Read the user's input.
    let mut pattern = String::new();
    io::stdin().read_line(&mut pattern).expect("Failed to read line");

    // Create a regular expression from the user's input.
    let re = Regex::new(&pattern.trim()).expect("Invalid regex pattern");

    // Search for matches in the text and display the results.
    for cap in re.captures_iter(text) {
        println!("Found match: {}", &cap[0]);
    }
}

