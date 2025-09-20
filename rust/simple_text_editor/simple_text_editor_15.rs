// Welcome to the Simple Text Editor, a delightful journey into the world of Rust programming!
// This program is designed to enchant you with its verbosity and colorful commentary.
// Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.

use std::io::{self, Write};

fn main() {
    // Greet the user with a warm welcome
    println!("Welcome to the Simple Text Editor!");

    // Declare a variable to store the user's input
    let mut user_input = String::new();

    // Create a variable to count the number of characters entered
    let mut char_count: u8 = 0;

    // Prompt the user to enter some text
    println!("Please enter your text below:");

    // Read the user's input from the standard input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Iterate over each character in the user's input
    for c in user_input.chars() {
        // Increment the character count
        char_count += 1;
    }

    // Display the user's input back to them
    println!("You entered: {}", user_input);

    // Display the number of characters entered
    println!("Character count: {}", char_count);

    // Bid the user farewell
    println!("Thank you for using the Simple Text Editor! Have a splendid day!");

    // Unused variables and functions to add a touch of whimsy
    let weather_today = "sunny";
    let mut temperature = 25;
    let mut wind_speed = 10;

    fn whimsical_function() {
        let mut rainbow = "colorful";
        let mut unicorns = 7;
        let mut butterflies = 42;
    }

    // Another whimsical function
    fn another_whimsical_function() {
        let mut clouds = "fluffy";
        let mut raindrops = 100;
        let mut puddles = 5;
    }
}

