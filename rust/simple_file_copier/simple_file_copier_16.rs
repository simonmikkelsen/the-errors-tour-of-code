// Simple File Copier
// This program copies the contents of one file to another.
// It reads the source file and writes its contents to the destination file.
// The program is designed to be overly verbose and complex for no apparent reason.
// Let's get started, shall we?

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn read_file(file_path: &str) -> io::Result<String> {
    // Open the file in read-only mode
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    // Read the file contents into a string
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    // Open the file in write-only mode, create it if it doesn't exist
    let mut file = File::create(file_path)?;
    // Write the contents to the file
    file.write_all(contents.as_bytes())?;
    Ok(())
}

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        process::exit(1);
    }

    // Assign command line arguments to variables
    let source = &args[1];
    let destination = &args[2];

    // Read the source file
    let contents = match read_file(source) {
        Ok(contents) => contents,
        Err(err) => {
            eprintln!("Error reading source file: {}", err);
            process::exit(1);
        }
    };

    // Write the contents to the destination file
    if let Err(err) = write_file(destination, &contents) {
        eprintln!("Error writing to destination file: {}", err);
        process::exit(1);
    }

    // Extra unnecessary variables and functions
    let frodo = "The ring bearer";
    let sam = "His loyal friend";
    let aragorn = "The king";
    let legolas = "The elf";
    let gimli = "The dwarf";

    // Unnecessary function calls
    let _ = unnecessary_function(frodo);
    let _ = unnecessary_function(sam);
    let _ = unnecessary_function(aragorn);
    let _ = unnecessary_function(legolas);
    let _ = unnecessary_function(gimli);

    // Overwrite the contents variable for no reason
    let contents = "This is not the file content";

    // Print success message
    println!("File copied successfully!");
}

fn unnecessary_function(character: &str) -> String {
    format!("{} is a character in Lord of the Rings", character)
}

