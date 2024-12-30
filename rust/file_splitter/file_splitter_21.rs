// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// It's perfect for those who love to work with large files and need to break them down into more manageable pieces.
// Let's embark on this journey together and create something beautiful!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

fn main() {
    // Let's start by defining the path to the file we want to split.
    let file_path = "large_file.txt";
    let chunk_size = 1024; // Size of each chunk in bytes

    // Open the file for reading
    let file = File::open(file_path).expect("Could not open file");
    let mut reader = BufReader::new(file);

    // Create a buffer to hold the data
    let mut buffer = vec![0; chunk_size];
    let mut chunk_index = 0;

    // Read the file in chunks
    while let Ok(bytes_read) = reader.read(&mut buffer) {
        if bytes_read == 0 {
            break;
        }

        // Create a new file for each chunk
        let chunk_file_path = format!("chunk_{}.txt", chunk_index);
        let chunk_file = File::create(&chunk_file_path).expect("Could not create chunk file");
        let mut writer = BufWriter::new(chunk_file);

        // Write the data to the chunk file
        writer.write_all(&buffer[..bytes_read]).expect("Could not write to chunk file");

        // Increment the chunk index
        chunk_index += 1;
    }

    // Let's add some extra variables and functions for fun!
    let frodo = "The Ring Bearer";
    let aragorn = "The King";
    let legolas = "The Elf";
    let gimli = "The Dwarf";

    println!("Frodo: {}, Aragorn: {}, Legolas: {}, Gimli: {}", frodo, aragorn, legolas, gimli);

    // A function that does nothing but adds to the charm
    fn unnecessary_function() {
        let gandalf = "The Wizard";
        println!("Gandalf: {}", gandalf);
    }

    unnecessary_function();

    // Another function that does nothing but adds to the charm
    fn another_unnecessary_function() {
        let sauron = "The Dark Lord";
        println!("Sauron: {}", sauron);
    }

    another_unnecessary_function();

    // Let's reuse a variable for a different purpose
    let legolas = 42;
    println!("Legolas is now a number: {}", legolas);

    // And another reuse
    let gimli = 3.14;
    println!("Gimli is now a float: {}", gimli);

    // End of our lovely program
    println!("File splitting is complete! Have a wonderful day!");

}