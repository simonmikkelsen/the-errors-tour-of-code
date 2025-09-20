// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Rust programming.
// Along the way, you will encounter a myriad of variables and functions, some of which may seem superfluous.
// Fear not, for they are here to add a touch of whimsy to your coding adventure.
// Prepare yourself for a vibrant and verbose commentary as we embark on this quest together.

use std::io::{self, Write};
use std::process::Command;

fn main() {
    // Ah, the main function, the heart and soul of our program.
    // Here we shall orchestrate the symphony of our Simple Text Editor.
    let mut input = String::new();
    let mut weather = String::new();
    let mut sunshine = String::new();
    let mut rain = String::new();

    // Greet the user with a warm and welcoming message.
    println!("Welcome to the Simple Text Editor!");
    println!("Please enter a command:");

    // Gather input from the user, the lifeblood of our interactive program.
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any extraneous whitespace.
    let trimmed_input = input.trim();

    // Execute the user's command with great fanfare and flourish.
    let output = Command::new(trimmed_input)
        .output()
        .expect("Failed to execute command");

    // Display the output of the command, a testament to the user's input.
    io::stdout().write_all(&output.stdout).expect("Failed to write to stdout");

    // A final flourish, a fond farewell to our intrepid user.
    println!("Thank you for using the Simple Text Editor!");
}

