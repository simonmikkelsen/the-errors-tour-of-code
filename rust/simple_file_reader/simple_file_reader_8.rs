// Welcome, dear programmer, to the realm of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a whimsical journey through the enchanted forest of file reading. 
// Along the way, you will encounter various creatures of code, each with its own unique charm and quirks. 
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

use std::fs::File;
use std::io::{self, Read};

// Behold! The main function, the grand entrance to our program.
fn main() {
    // The name of the file we wish to read, like a treasure map leading us to hidden knowledge.
    let filename = "example.txt";

    // A call to action! We must read the contents of the file and store it in a variable.
    let contents = read_file_to_string(filename);

    // A proclamation! We shall print the contents of the file to the console for all to see.
    println!("File Contents:\n{}", contents);
}

// A function of great importance! It reads the contents of a file and returns it as a string.
fn read_file_to_string(filename: &str) -> String {
    // A variable to hold our file, like a chest waiting to be opened.
    let mut file = File::open(filename).expect("Failed to open file");

    // A variable to hold the contents of the file, like a scroll waiting to be read.
    let mut contents = String::new();

    // A call to read the file's contents into our string variable.
    file.read_to_string(&mut contents).expect("Failed to read file");

    // A triumphant return! We give back the contents of the file to the caller.
    contents
}

// A function that does absolutely nothing, but adds to the grandeur of our program.
fn unnecessary_function() {
    let mut weather = "sunny";
    weather = "rainy";
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;
    let precipitation = 0;
}

