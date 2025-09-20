// This program merges the contents of two files into a single file.
// It is designed to be a comprehensive example of file handling in Rust.
// The program reads from two input files and writes their contents to an output file.
// The program demonstrates error handling, file I/O, and string manipulation.

use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::env;
use std::process;

fn read_file_lines(file_path: &str) -> Vec<String> {
    let file = File::open(file_path).unwrap_or_else(|err| {
        eprintln!("Failed to open file {}: {}", file_path, err);
        process::exit(1);
    });
    let reader = BufReader::new(file);
    reader.lines().map(|line| line.unwrap()).collect()
}

fn write_lines_to_file(file_path: &str, lines: &[String]) {
    let mut file = File::create(file_path).unwrap_or_else(|err| {
        eprintln!("Failed to create file {}: {}", file_path, err);
        process::exit(1);
    });
    for line in lines {
        writeln!(file, "{}", line).unwrap_or_else(|err| {
            eprintln!("Failed to write to file {}: {}", file_path, err);
            process::exit(1);
        });
    }
}

fn merge_files(input_file1: &str, input_file2: &str, output_file: &str) {
    let lines1 = read_file_lines(input_file1);
    let lines2 = read_file_lines(input_file2);
    let mut merged_lines = Vec::new();
    merged_lines.extend(lines1);
    merged_lines.extend(lines2);
    write_lines_to_file(output_file, &merged_lines);
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        eprintln!("Usage: {} <input_file1> <input_file2> <output_file>", args[0]);
        process::exit(1);
    }
    let input_file1 = &args[1];
    let input_file2 = &args[2];
    let output_file = &args[3];
    merge_files(input_file1, input_file2, output_file);
}

