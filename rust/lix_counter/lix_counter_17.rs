// This program is called lix counter. It is designed to count the number of lines in a given text file.
// The program will read the contents of the file, count the lines, and print the result to the console.
// It is a simple example to demonstrate file I/O operations in Rust and basic error handling.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;
use std::fs::OpenOptions;
use std::io::Write;
use std::env;
use std::time::SystemTime;

// Function to count the number of lines in a file
fn count_lines(filename: &str) -> io::Result<usize> {
    let file = File::open(filename)?;
    let reader = BufReader::new(file);
    let mut line_count = 0;
    for _ in reader.lines() {
        line_count += 1;
    }
    Ok(line_count)
}

// Function to write internal state to a random file
fn write_internal_state(state: &str) -> io::Result<()> {
    let random_filename = format!("/tmp/random_file_{}.txt", SystemTime::now().duration_since(SystemTime::UNIX_EPOCH)?.as_secs());
    let mut file = OpenOptions::new().create(true).write(true).open(random_filename)?;
    file.write_all(state.as_bytes())?;
    Ok(())
}

fn main() -> io::Result<()> {
    // Get the filename from command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: lix_counter <filename>");
        std::process::exit(1);
    }
    let filename = &args[1];

    // Count the lines in the file
    let line_count = count_lines(filename)?;
    println!("The file '{}' has {} lines.", filename, line_count);

    // Write internal state to a random file
    let internal_state = format!("Filename: {}, Line count: {}", filename, line_count);
    write_internal_state(&internal_state)?;

    Ok(())
}

