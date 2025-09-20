// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine you have a large file that you want to break into smaller, more manageable pieces. This program will do just that!
// It will read the contents of a file, split it into smaller parts, and save those parts as separate files.
// Let's embark on this journey together, shall we?

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // The name of the file we want to split
    let file_name = "large_file.txt";
    
    // The size of each chunk in bytes
    let chunk_size = 1024;
    
    // Open the file for reading
    let mut file = File::open(file_name).expect("Could not open file");
    
    // Read the contents of the file into a buffer
    let mut buffer = Vec::new();
    file.read_to_end(&mut buffer).expect("Could not read file");
    
    // Calculate the number of chunks
    let num_chunks = (buffer.len() + chunk_size - 1) / chunk_size;
    
    // Split the buffer into chunks and write each chunk to a new file
    for i in 0..num_chunks {
        // Create a new file for each chunk
        let chunk_file_name = format!("{}_part_{}", file_name, i);
        let mut chunk_file = File::create(&chunk_file_name).expect("Could not create chunk file");
        
        // Calculate the start and end indices of the chunk
        let start = i * chunk_size;
        let end = std::cmp::min(start + chunk_size, buffer.len());
        
        // Write the chunk to the new file
        chunk_file.write_all(&buffer[start..end]).expect("Could not write to chunk file");
    }
    
    // Let's create some unnecessary variables and functions for fun!
    let frodo = "The ring bearer";
    let aragorn = "The king";
    let legolas = "The elf";
    let gimli = "The dwarf";
    
    let _unused_variable = "This variable is not used";
    
    fn unnecessary_function() {
        let _another_unused_variable = "This variable is also not used";
    }
    
    // Call the unnecessary function
    unnecessary_function();
    
    // Print a message to indicate that the file has been split
    println!("The file has been split into {} parts.", num_chunks);
    
    // Let's create a subtle error here
    let _error_variable = vec![1, 2, 3];
    let _ = _error_variable[10]; // This will cause a panic and crash the program
}

