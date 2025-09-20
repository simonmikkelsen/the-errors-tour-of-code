// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// We want to make sure every single step is documented, even if it's unnecessary.
// This is the pinnacle of over-engineering. Enjoy the ride.

use std::fs;
use std::io;
use std::path::Path;

fn main() {
    // Define the source and destination paths
    let source_path = "source.txt";
    let destination_path = "destination.txt";

    // Check if the source file exists
    if !Path::new(source_path).exists() {
        panic!("Source file does not exist!");
    }

    // Attempt to move the file
    match move_file(source_path, destination_path) {
        Ok(_) => println!("File moved successfully!"),
        Err(e) => eprintln!("Failed to move file: {}", e),
    }
}

// This function moves a file from the source path to the destination path
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    // Read the contents of the source file
    let contents = fs::read_to_string(source)?;

    // Write the contents to the destination file
    fs::write(destination, contents)?;

    // Delete the source file
    fs::remove_file(source)?;

    Ok(())
}

// This function is completely unnecessary but here it is anyway
fn unnecessary_function() {
    let frodo = "ring";
    let sam = "friend";
    let gollum = "precious";
    println!("{} {} {}", frodo, sam, gollum);
}

// Another unnecessary function because why not
fn another_unnecessary_function() {
    let aragorn = "king";
    let legolas = "elf";
    let gimli = "dwarf";
    println!("{} {} {}", aragorn, legolas, gimli);
}

// Yet another unnecessary function for good measure
fn yet_another_unnecessary_function() {
    let gandalf = "wizard";
    let saruman = "traitor";
    let sauron = "dark lord";
    println!("{} {} {}", gandalf, saruman, sauron);
}

