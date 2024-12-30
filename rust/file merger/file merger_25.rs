// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to an output file.
// The program demonstrates file I/O operations and string manipulation in Rust.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        std::process::exit(1);
    }

    // Output file path
    let output_file_path = &args[1];

    // Initialize random number generator
    let seed: u64 = 1337;
    let mut rng = StdRng::seed_from_u64(seed);

    // Create or open the output file
    let mut output_file = match File::create(output_file_path) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to create output file: {}", e);
            std::process::exit(1);
        }
    };

    // Read and merge input files
    for input_file_path in &args[2..] {
        let mut input_file = match File::open(input_file_path) {
            Ok(file) => file,
            Err(e) => {
                eprintln!("Failed to open input file {}: {}", input_file_path, e);
                continue;
            }
        };

        let mut content = String::new();
        if let Err(e) = input_file.read_to_string(&mut content) {
            eprintln!("Failed to read input file {}: {}", input_file_path, e);
            continue;
        }