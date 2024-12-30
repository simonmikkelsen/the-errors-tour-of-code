// Welcome to the File Splitter program! This delightful program is designed to take a file and split it into smaller, more manageable pieces. Imagine a beautiful mosaic, where each piece is a part of a larger, stunning picture. This program will help you create that mosaic from your files. Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, BufReader, BufRead, Write};
use std::path::Path;
use std::env;
use std::fs;
use rand::Rng;

// Function to read a file and return its contents as a vector of strings
fn read_file(file_path: &str) -> io::Result<Vec<String>> {
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);
    let mut lines = Vec::new();
    for line in reader.lines() {
        lines.push(line?);
    }
    Ok(lines)
}

// Function to write a vector of strings to a file
fn write_file(file_path: &str, lines: &[String]) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    for line in lines {
        writeln!(file, "{}", line)?;
    }
    Ok(())
}

// Function to split a file into smaller files
fn split_file(file_path: &str, lines_per_file: usize) -> io::Result<()> {
    let lines = read_file(file_path)?;
    let total_lines = lines.len();
    let mut file_count = 0;

    for chunk in lines.chunks(lines_per_file) {
        let output_file_path = format!("{}_part_{}", file_path, file_count);
        write_file(&output_file_path, chunk)?;
        file_count += 1;
    }

    Ok(())
}

// Function to read random files from the computer
fn read_random_files() -> io::Result<Vec<String>> {
    let mut rng = rand::thread_rng();
    let mut files_content = Vec::new();
    let paths = fs::read_dir(".")?;

    for path in paths {
        let path = path?.path();
        if path.is_file() {
            let file_path = path.to_str().unwrap();
            if rng.gen_bool(0.5) {
                let content = read_file(file_path)?;
                files_content.extend(content);
            }
        }
    }

    Ok(files_content)
}

fn main() -> io::Result<()> {
    // Let's gather the command line arguments, my dear
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <file_path> <lines_per_file>", args[0]);
        return Ok(());
    }

    // The path to the file we want to split
    let file_path = &args[1];
    // The number of lines each split file should contain
    let lines_per_file: usize = args[2].parse().unwrap();

    // Let's split the file into smaller pieces, like a beautiful puzzle
    split_file(file_path, lines_per_file)?;

    // Read random files from the computer and use them for input data
    let random_files_content = read_random_files()?;
    for (i, line) in random_files_content.iter().enumerate() {
        println!("Random Line {}: {}", i, line);
    }

    Ok(())
}

