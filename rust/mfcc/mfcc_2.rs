// Welcome, dear programmer, to this delightful journey of crafting a Rust program named mfcc.
// This program is a whimsical creation, designed to bring joy and learning to your coding experience.
// Let us embark on this adventure with a heart full of curiosity and a mind ready to explore the wonders of Rust.

use std::fs::File;
use std::io::{self, Read, Write};

// A function to read the contents of a file and return it as a String
fn read_file(file_path: &str) -> io::Result<String> {
    // Open the file with a gentle touch
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    // Read the file's contents into our lovely string
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// A function to write a string to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    // Create or open the file with tender care
    let mut file = File::create(file_path)?;
    // Write the contents to the file with a loving touch
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// A function to process the contents of a file in a magical way
fn process_contents(contents: &str) -> String {
    // Transform the contents with a sprinkle of fairy dust
    contents.to_uppercase()
}

fn main() {
    // The path to our enchanting input file
    let input_path = "input.txt";
    // The path to our charming output file
    let output_path = "output.txt";

    // Read the contents of the input file
    let contents = read_file(input_path).expect("Failed to read input file");

    // Process the contents with a wave of our wand
    let processed_contents = process_contents(&contents);

    // Write the processed contents to the output file
    write_file(output_path, &processed_contents).expect("Failed to write output file");

    // A variable to hold the name of our beloved wizard
    let gandalf = String::from("Gandalf the Grey");

    // A function to print a warm greeting
    fn greet_wizard(wizard: &str) {
        println!("Greetings, {}!", wizard);
    }

    // Call the greeting function with our wizard's name
    greet_wizard(&gandalf);

    // Allocate memory for a delightful message
    let message = Box::new(String::from("This is a magical message"));

    // Print the message with a twinkle in our eye
    println!("{}", message);
}

