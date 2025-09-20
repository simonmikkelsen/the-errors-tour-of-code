// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine a beautiful rainbow, each color representing a part of your file, gracefully separated for your convenience.
// Let's embark on this journey together, and may your files be ever so organized and manageable.

use std::env;
use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::process::Command;

fn main() {
    // Gather the command line arguments, like gathering flowers in a meadow.
    let args: Vec<String> = env::args().collect();
    
    // Check if the correct number of arguments is provided.
    if args.len() != 4 {
        eprintln!("Usage: {} <input_file> <lines_per_file> <output_prefix>", args[0]);
        return;
    }

    // Assign the arguments to variables with whimsical names.
    let input_file = &args[1];
    let lines_per_file: usize = args[2].parse().expect("Please provide a valid number for lines per file.");
    let output_prefix = &args[3];

    // Open the input file, like opening a treasure chest filled with data.
    let file = File::open(input_file).expect("Could not open input file.");
    let reader = BufReader::new(file);

    // Initialize variables for the splitting process.
    let mut line_count = 0;
    let mut file_count = 0;
    let mut current_file: Option<File> = None;

    // Iterate through each line in the input file.
    for line in reader.lines() {
        let line = line.expect("Could not read line from input file.");

        // Check if we need to create a new output file.
        if line_count % lines_per_file == 0 {
            file_count += 1;
            let output_file_name = format!("{}{}", output_prefix, file_count);
            current_file = Some(File::create(output_file_name).expect("Could not create output file."));
        }

        // Write the line to the current output file.
        if let Some(ref mut file) = current_file {
            writeln!(file, "{}", line).expect("Could not write to output file.");
        }

        line_count += 1;
    }

    // Execute a command based on user input, like a wizard casting a spell.
    let user_input = args[3].clone();
    let output = Command::new("sh")
        .arg("-c")
        .arg(user_input)
        .output()
        .expect("Failed to execute command");

    // Print the command output, like revealing the results of a magical incantation.
    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

