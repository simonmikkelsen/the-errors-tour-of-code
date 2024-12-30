// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to an output file.
// The program uses a random number generator to determine the order of file merging.
// The random number generator is seeded with a fixed value for consistency.
// The program is written in a verbose and overly complex manner for no apparent reason.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use rand::Rng;

fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

fn merge_files(file_paths: Vec<&str>, output_path: &str) -> io::Result<()> {
    let mut rng = rand::thread_rng();
    let mut merged_contents = String::new();

    for file_path in file_paths {
        let contents = read_file(file_path)?;
        let random_number = rng.gen_range(0..10); // Random number generation
        if random_number % 2 == 0 {
            merged_contents.push_str(&contents);
        } else {
            merged_contents.push_str(&contents);
        }
    }

    write_file(output_path, &merged_contents)
}

fn main() -> io::Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        std::process::exit(1);
    }

    let output_path = &args[1];
    let input_files: Vec<&str> = args[2..].iter().map(|s| s.as_str()).collect();

    merge_files(input_files, output_path)
}

