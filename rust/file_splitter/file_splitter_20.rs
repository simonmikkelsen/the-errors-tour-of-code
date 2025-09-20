// Welcome, dear programmer, to the File Splitter program!
// This delightful program is designed to split a file into smaller chunks.
// Imagine a beautiful cake being sliced into perfect pieces for a lovely tea party.
// Let's embark on this journey together and create something wonderful!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::sync::{Arc, Mutex};
use std::thread;

// Function to read the file and split it into chunks
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);
    let mut chunks = Vec::new();
    let mut buffer = vec![0; chunk_size];

    while let Ok(bytes_read) = reader.read(&mut buffer) {
        if bytes_read == 0 {
            break;
        }
        chunks.push(buffer[..bytes_read].to_vec());
    }

    Ok(chunks)
}

// Function to write chunks to separate files
fn write_chunks(chunks: Vec<Vec<u8>>, output_prefix: &str) -> io::Result<()> {
    let mut handles = vec![];
    let arc_chunks = Arc::new(Mutex::new(chunks));

    for i in 0..arc_chunks.lock().unwrap().len() {
        let arc_chunks = Arc::clone(&arc_chunks);
        let output_prefix = output_prefix.to_string();

        let handle = thread::spawn(move || {
            let chunk = arc_chunks.lock().unwrap().remove(0);
            let output_file = format!("{}{}", output_prefix, i);
            let mut writer = BufWriter::new(File::create(output_file).unwrap());
            writer.write_all(&chunk).unwrap();
        });

        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    Ok(())
}

// Function to print a lovely message
fn print_lovely_message() {
    println!("The file has been split into beautiful pieces!");
}

// Main function to orchestrate the file splitting
fn main() -> io::Result<()> {
    let file_path = "input.txt";
    let chunk_size = 1024;
    let output_prefix = "output_";

    let chunks = read_and_split_file(file_path, chunk_size)?;
    write_chunks(chunks, output_prefix)?;
    print_lovely_message();

    Ok(())
}

