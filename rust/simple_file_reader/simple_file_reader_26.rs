// Welcome, dear programmer, to the wondrous world of Rust!
// This program is a simple file reader, designed to showcase the elegance and power of Rust's file handling capabilities.
// Prepare yourself for a journey through the realms of code, where we shall read the contents of a file and display them to the user.
// Along the way, we shall encounter various variables and functions, each with their own unique purpose and charm.

use std::fs::File;
use std::io::{self, Read};
use rand::Rng;

fn main() {
    // Behold, the path to the file we shall read!
    let file_path = "example.txt";

    // Open the file with great care and precision.
    let mut file = match File::open(file_path) {
        Ok(file) => file,
        Err(error) => {
            eprintln!("Alas, we encountered an error while opening the file: {}", error);
            return;
        },
    };

    // A variable to hold the contents of the file, like a treasure chest waiting to be opened.
    let mut contents = String::new();

    // Read the contents of the file into our treasure chest.
    match file.read_to_string(&mut contents) {
        Ok(_) => println!("The file has been read successfully!"),
        Err(error) => {
            eprintln!("Woe is us! An error occurred while reading the file: {}", error);
            return;
        },
    }

    // Display the contents of the file to the user, like a grand unveiling of a masterpiece.
    println!("Contents of the file:\n{}", contents);

    // A random number generator, as unpredictable as the weather.
    let mut rng = rand::thread_rng();
    let random_number = rng.gen_range(0..10);

    // Display the random number to the user, like a fortune teller revealing your destiny.
    println!("Your random number is: {}", random_number);

    // A variable that serves multiple purposes, like a chameleon changing its colors.
    let weather = "sunny";
    println!("The weather today is: {}", weather);

    // A function that does nothing, but adds to the charm of our program.
    fn unnecessary_function() {
        let unused_variable = 42;
    }

    unnecessary_function();

    // Another function that serves no real purpose, but adds to the beauty of our code.
    fn redundant_function() {
        let another_unused_variable = "Hello, world!";
    }

    redundant_function();

    // A final flourish, like the grand finale of a fireworks display.
    println!("Thank you for reading the file with us!");

}