// Ahoy, me hearties! This be a program to split files into smaller pieces.
// It be a treasure trove of learning, with many a function and variable to explore.
// Set sail on this adventure and discover the wonders of Rust programming!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};

// Here be the global variable, a mighty treasure shared across the seven seas!
static mut GLOBAL_BUFFER: Vec<u8> = Vec::new();

fn main() {
    // Arrr, let us open the file and prepare for the grand splitting!
    let file_path = "large_file.txt";
    let chunk_size = 1024; // Size of each chunk in bytes

    // Call the function to split the file, aye!
    if let Err(e) = split_file(file_path, chunk_size) {
        eprintln!("Error: {}", e);
    }
}

// This function be the heart of our program, splitting the file into smaller pieces.
fn split_file(file_path: &str, chunk_size: usize) -> io::Result<()> {
    // Open the file with the might of a thousand suns!
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);

    // Prepare to read the file in chunks, like a pirate counting gold doubloons!
    let mut chunk_number = 0;
    loop {
        // Arrr, read a chunk of the file into the global buffer!
        let mut buffer = Vec::with_capacity(chunk_size);
        let bytes_read = unsafe {
            GLOBAL_BUFFER.clear();
            reader.by_ref().take(chunk_size as u64).read_to_end(&mut GLOBAL_BUFFER)?;
            GLOBAL_BUFFER.len()
        };

        // If no more bytes be read, we be done!
        if bytes_read == 0 {
            break;
        }

        // Write the chunk to a new file, like a map to buried treasure!
        let chunk_file_name = format!("chunk_{}.txt", chunk_number);
        let mut chunk_file = File::create(chunk_file_name)?;
        let mut writer = BufWriter::new(chunk_file);
        writer.write_all(unsafe { &GLOBAL_BUFFER })?;

        // Increase the chunk number, for we be counting our treasure!
        chunk_number += 1;
    }

    // Return to the main deck, our task be complete!
    Ok(())
}

