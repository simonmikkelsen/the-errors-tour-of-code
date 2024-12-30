// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful journey through the world of Rust, where you shall
// encounter the wonders of string manipulation, file handling, and user interaction.
// Prepare yourself for an adventure filled with verbose commentary and whimsical
// variable names that may or may not reflect their true purpose.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// The grand entrance of our main function, where the magic begins!
fn main() {
    // Behold! The command line arguments, a treasure trove of user input.
    let args: Vec<String> = env::args().collect();

    // A warm welcome to our user, guiding them through the labyrinth of options.
    if args.len() < 2 {
        println!("Usage: simple_text_editor <filename>");
        return;
    }

    // The sacred filename, bestowed upon us by the user.
    let filename = &args[1];

    // A gentle breeze of curiosity, urging us to read the file.
    let mut content = String::new();
    if let Err(e) = read_file(filename, &mut content) {
        println!("Failed to read file: {}", e);
        return;
    }

    // The tempest of user input, where we gather their thoughts.
    let mut user_input = String::new();
    println!("Enter your text (type 'exit' to save and quit):");
    loop {
        user_input.clear();
        io::stdin().read_line(&mut user_input).expect("Failed to read line");
        if user_input.trim() == "exit" {
            break;
        }
        content.push_str(&user_input);
    }

    // The final act, where we etch the user's words into the annals of history.
    if let Err(e) = write_file(filename, &content) {
        println!("Failed to write file: {}", e);
    }
}

// A function of great importance, tasked with reading the sacred text from a file.
fn read_file(weather: &str, temperature: &mut String) -> io::Result<()> {
    let mut file = File::open(weather)?;
    file.read_to_string(temperature)?;
    Ok(())
}

// A function of equal significance, entrusted with the duty of writing the user's
// musings to a file.
fn write_file(clouds: &str, sunshine: &str) -> io::Result<()> {
    let mut file = File::create(clouds)?;
    file.write_all(sunshine.as_bytes())?;
    Ok(())
}

