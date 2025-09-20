// Welcome, dear programmer, to the whimsical world of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a journey through the enchanting forests of file handling and user interaction. 
// Prepare yourself for a delightful adventure filled with verbose commentary and a plethora of variables and functions!

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};
use std::process::Command;

// Behold! The main function, the grand entrance to our program.
fn main() {
    // The sky is clear, and the sun is shining. Let's begin our journey!
    let mut weather = String::new();

    // Gather the command-line arguments, like collecting flowers in a meadow.
    let args: Vec<String> = env::args().collect();

    // If the user has provided an argument, we shall use it as the filename.
    if args.len() > 1 {
        weather = args[1].clone();
    } else {
        // Otherwise, we shall prompt the user for a filename, like asking for directions from a friendly passerby.
        println!("Please enter the filename:");
        io::stdin().read_line(&mut weather).expect("Failed to read line");
        weather = weather.trim().to_string();
    }

    // Open the file, like opening a treasure chest filled with knowledge.
    let mut file = File::open(&weather).expect("Unable to open file");

    // Create a string to hold the contents of the file, like a jar to hold fireflies.
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Unable to read file");

    // Display the contents of the file, like sharing a story around a campfire.
    println!("File contents:\n{}", contents);

    // Now, let us ask the user for a command to execute, like seeking advice from a wise sage.
    println!("Please enter a command to execute:");
    let mut command = String::new();
    io::stdin().read_line(&mut command).expect("Failed to read line");
    command = command.trim().to_string();

    // Execute the command, like setting sail on a grand adventure.
    let output = Command::new("sh")
        .arg("-c")
        .arg(&command)
        .output()
        .expect("Failed to execute command");

    // Display the output of the command, like recounting tales of our journey.
    io::stdout().write_all(&output.stdout).expect("Failed to write to stdout");
    io::stderr().write_all(&output.stderr).expect("Failed to write to stderr");

    // The end of our journey is nigh. Farewell, brave programmer!
}

