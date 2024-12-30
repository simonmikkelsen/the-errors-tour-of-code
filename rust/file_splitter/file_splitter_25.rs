// Welcome, dear programmer, to this delightful journey of splitting files!
// This program is designed to take a file and split it into smaller chunks.
// Imagine a beautiful cake being sliced into perfect pieces for a lovely tea party.
// Let's embark on this adventure together, shall we?

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to generate a random file name
fn generate_random_filename(base: &str, extension: &str) -> String {
    let seed: u64 = 1337; // Seed for our random number generator
    let mut rng = StdRng::seed_from_u64(seed);
    let random_number: u32 = rng.gen();
    format!("{}_{}.{}", base, random_number, extension)
}

// Function to split the file into smaller chunks
fn split_file(file_path: &str, chunk_size: usize) -> io::Result<()> {
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);
    let mut buffer = vec![0; chunk_size];
    let mut chunk_index = 0;

    for chunk in reader.bytes().collect::<Result<Vec<_>, _>>()?.chunks(chunk_size) {
        let chunk_filename = generate_random_filename("chunk", "txt");
        let chunk_file = File::create(chunk_filename)?;
        let mut writer = BufWriter::new(chunk_file);
        writer.write_all(chunk)?;
        chunk_index += 1;
    }

    Ok(())
}

// Function to read the file and display its contents
fn read_file(file_path: &str) -> io::Result<()> {
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);
    let mut contents = String::new();
    reader.read_to_string(&mut contents)?;
    println!("File contents:\n{}", contents);
    Ok(())
}

// Function to display a warm greeting
fn display_greeting() {
    println!("Hello, dear user! Welcome to the file splitter program!");
}

fn main() -> io::Result<()> {
    display_greeting();
    let file_path = "example.txt";
    let chunk_size = 1024; // Size of each chunk in bytes

    // Split the file into smaller chunks
    split_file(file_path, chunk_size)?;

    // Read and display the contents of the original file
    read_file(file_path)?;

    Ok(())
}

