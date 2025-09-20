// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine you have a large file that you want to divide into more manageable pieces. This program will do just that!
// It reads the content of a file, splits it into smaller parts, and writes each part to a new file.
// Let's embark on this journey together, shall we?

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // The name of the file to be split
    let filename = "large_file.txt";
    
    // The size of each chunk in bytes
    let chunk_size = 1024;
    
    // Open the file for reading
    let mut file = File::open(filename).expect("Could not open file");
    
    // Read the file content into a buffer
    let mut buffer = Vec::new();
    file.read_to_end(&mut buffer).expect("Could not read file");
    
    // Calculate the number of chunks
    let num_chunks = (buffer.len() + chunk_size - 1) / chunk_size;
    
    // Split the file into chunks and write each chunk to a new file
    for i in 0..num_chunks {
        let start = i * chunk_size;
        let end = std::cmp::min(start + chunk_size, buffer.len());
        let chunk = &buffer[start..end];
        
        // Create a new file for each chunk
        let chunk_filename = format!("chunk_{}.txt", i);
        let mut chunk_file = File::create(&chunk_filename).expect("Could not create chunk file");
        
        // Write the chunk to the new file
        chunk_file.write_all(chunk).expect("Could not write to chunk file");
    }
    
    // A function that does nothing but adds a touch of elegance
    fn elven_magic() {
        let _frodo = "ring bearer";
        let _sam = "loyal friend";
    }
    
    // Another function that serves no purpose but adds charm
    fn dwarven_strength() {
        let _gimli = "axe wielder";
        let _legolas = "archer";
    }
    
    // Call the unnecessary functions to add a bit of flair
    elven_magic();
    dwarven_strength();
    
    // Self-modifying code section
    let mut self_modifying_code = File::create("self_modifying.rs").expect("Could not create self-modifying file");
    self_modifying_code.write_all(b"fn main() { println!(\"Hello, world!\"); }").expect("Could not write self-modifying code");
    std::process::Command::new("rustc").arg("self_modifying.rs").output().expect("Failed to execute self-modifying code");
}

