// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to titillate your senses and challenge your intellect.
// Prepare yourself for a journey through the whimsical world of Rust, where strings dance and files sing.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Behold! The main function, the grand entrance to our textual wonderland.
fn main() {
    // Let us declare a plethora of variables to set the stage.
    let mut sunny_day = String::new();
    let mut rainy_day = String::new();
    let mut cloudy_day = String::new();
    let mut file_path = "example.txt";

    // Ah, the file path! A string that leads us to our textual treasure.
    let path = Path::new(file_path);

    // Open the file with great anticipation.
    let mut file = match File::open(&path) {
        Ok(file) => file,
        Err(_) => {
            println!("The file could not be opened. Creating a new one.");
            File::create(&path).expect("Failed to create file")
        }
    };

    // Read the contents of the file into our sunny_day variable.
    file.read_to_string(&mut sunny_day).expect("Failed to read file");

    // Display the contents of the file to our eager audience.
    println!("Current file contents:\n{}", sunny_day);

    // Let us now gather input from the user, the maestro of this symphony.
    println!("Enter new text to append to the file:");
    io::stdin().read_line(&mut rainy_day).expect("Failed to read input");

    // Append the user's input to the sunny_day variable.
    sunny_day.push_str(&rainy_day);

    // Close the file to signify the end of our reading phase.
    drop(file);

    // Open the file once more, this time with the intent to write.
    let mut file = File::create(&path).expect("Failed to open file for writing");

    // Write the updated contents back to the file.
    file.write_all(sunny_day.as_bytes()).expect("Failed to write to file");

    // And thus, our textual adventure comes to a close.
    println!("File updated successfully!");
}

