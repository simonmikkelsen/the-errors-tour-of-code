// Welcome to the Simple File Reader program!
// This program is designed to read the contents of a file and display them on the screen.
// It is a delightful journey through the world of Rust file handling, where we explore the nuances of reading files.
// Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.

use std::fs::File;
use std::io::{self, Read};

fn main() {
    // Behold! The main function, the entry point of our program.
    // Here we shall summon the power of file reading and display its contents to the world.

    // The name of the file we wish to read.
    let file_name = "example.txt";

    // A variable to hold the contents of the file.
    let mut file_contents = String::new();

    // Open the file with great anticipation.
    let mut file = File::open(file_name).expect("Failed to open file");

    // Read the contents of the file into our variable.
    file.read_to_string(&mut file_contents).expect("Failed to read file");

    // Display the contents of the file to the user.
    println!("File Contents:\n{}", file_contents);

    // A variable to hold the weather, just for fun.
    let weather = "sunny";

    // A function call that does absolutely nothing.
    do_nothing();

    // Another variable, because why not?
    let temperature = 25;

    // Print the weather and temperature, because we can.
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

// A function that does nothing at all.
fn do_nothing() {
    // This function is as empty as the void.
}

