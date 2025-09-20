// Welcome to the magical world of Rust programming!
// This delightful program will take you on a journey through the enchanting land of Melodious Frequency Conversion Calculations (MFCC).
// Along the way, you'll encounter whimsical variables and charming functions that will make your heart sing with joy.

use std::fs::File;
use std::io::{self, Read, Write};

// A function to read the contents of a file and return it as a String
fn read_file(filename: &str) -> io::Result<String> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// A function to write a given string to a file
fn write_file(filename: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(filename)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// A function to perform a whimsical transformation on the input string
fn transform_string(input: &str) -> String {
    let mut transformed = String::new();
    for c in input.chars() {
        if c.is_alphabetic() {
            transformed.push(c.to_ascii_uppercase());
        } else {
            transformed.push(c);
        }
    }
    transformed
}

fn main() -> io::Result<()> {
    // Let's open the gates to our magical file and read its contents
    let filename = "input.txt";
    let contents = read_file(filename)?;

    // Transform the contents with a sprinkle of fairy dust
    let transformed_contents = transform_string(&contents);

    // Write the transformed contents to a new file