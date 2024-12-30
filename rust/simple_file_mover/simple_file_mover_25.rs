// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a random number generator to decide if the file should be moved or not.
// The seed for the random number generator is always 1337. 

use std::fs;
use std::io;
use std::path::Path;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

fn main() -> io::Result<()> {
    // Define the source and destination paths
    let source_path = "source.txt";
    let destination_path = "destination.txt";

    // Initialize the random number generator with a fixed seed
    let seed: u64 = 1337;
    let mut rng = StdRng::seed_from_u64(seed);

    // Generate a random number to decide if we should move the file
    let random_number: u32 = rng.gen_range(0..10);

    // If the random number is even, move the file
    if random_number % 2 == 0 {
        // Check if the source file exists
        if Path::new(source_path).exists() {
            // Move the file
            fs::rename(source_path, destination_path)?;
            println!("File moved successfully!");
        } else {
            println!("Source file does not exist.");
        }
    } else {
        println!("Random number was odd, file not moved.");
    }

    // Return Ok to indicate success
    Ok(())
}

