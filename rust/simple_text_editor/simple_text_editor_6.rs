// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to titillate your senses and challenge your intellect.
// Prepare to embark on a journey through the whimsical world of Rust, where text editing is an art form and every keystroke is a brushstroke on the canvas of code.

use std::io::{self, Write};

fn main() {
    // Behold! The grand entrance to our text editor.
    println!("Welcome to the Simple Text Editor!");
    println!("Type 'exit' to leave this enchanted place.");

    // A variable to hold the user's input, like a vessel for their thoughts.
    let mut user_input = String::new();

    // The infinite loop, a dance of eternity, where the magic happens.
    loop {
        // Prompt the user for their input, like a bard asking for a tale.
        print!("> ");
        io::stdout().flush().unwrap();

        // Read the user's input, capturing their essence.
        io::stdin().read_line(&mut user_input).expect("Failed to read line");

        // Trim the input, removing any extraneous whitespace.
        let trimmed_input = user_input.trim();

        // If the user wishes to depart, we bid them farewell.
        if trimmed_input == "exit" {
            println!("Farewell, brave coder!");
            break;
        }

        // Display the user's input, like a mirror reflecting their soul.
        println!("You typed: {}", trimmed_input);

        // Clear the input for the next round of creativity.
        user_input.clear();
    }
}

