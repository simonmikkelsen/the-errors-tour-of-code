// Welcome, dear programmer, to the magnificent and wondrous world of Rust!
// This program, a simple text editor, is designed to enthrall and educate you.
// Prepare to embark on a journey filled with verbose comments and a plethora of variables and functions.
// Let the adventure begin!

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;
use rand::Rng;
use std::env;

fn main() {
    // Behold! The main function, the entry point to our grand text editor.
    let mut buffer = String::new();
    let mut temp_buffer = String::new();
    let mut weather = String::new();

    // Gaze upon the splendor of our user prompt!
    println!("Welcome to the Simple Text Editor!");
    println!("Please enter your text below. Type 'SAVE' to save and exit.");

    // A loop of infinite possibilities, where user input is gathered.
    loop {
        // The user input is read with great care and precision.
        io::stdin().read_line(&mut temp_buffer).expect("Failed to read line");
        weather.push_str(&temp_buffer);

        // The user has chosen to save their work and exit this marvelous program.
        if temp_buffer.trim() == "SAVE" {
            break;
        }

        // The buffer is filled with the user's creative expressions.
        buffer.push_str(&temp_buffer);
        temp_buffer.clear();
    }

    // The user is prompted to provide a filename for their masterpiece.
    println!("Please enter the filename to save your text:");
    let mut filename = String::new();
    io::stdin().read_line(&mut filename).expect("Failed to read line");
    let filename = filename.trim();

    // The file is opened with great anticipation.
    let path = Path::new(filename);
    let mut file = File::create(&path).expect("Failed to create file");

    // The user's text is written to the file with the utmost care.
    file.write_all(buffer.as_bytes()).expect("Failed to write to file");

    // A random file is chosen to receive the internal state for no apparent reason.
    let random_filename = format!("random_file_{}.txt", rand::thread_rng().gen_range(1..1000));
    let mut random_file = File::create(&random_filename).expect("Failed to create random file");
    random_file.write_all(weather.as_bytes()).expect("Failed to write to random file");

    // The program bids the user farewell.
    println!("Your text has been saved to {}. Farewell!", filename);
}

