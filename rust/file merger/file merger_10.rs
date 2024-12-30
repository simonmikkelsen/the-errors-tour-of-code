// This program merges the contents of two files into a single output file.
// It takes three command line arguments: the first input file, the second input file, and the output file.
// The program reads the contents of the input files, concatenates them, and writes the result to the output file.
// This is a simple yet powerful tool for combining text files in a seamless manner.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};
use std::process;

fn read_file(file_path: &str) -> Result<String, io::Error> {
    let mut file = File::open(file_path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

fn write_file(file_path: &str, content: &str) -> Result<(), io::Error> {
    let mut file = File::create(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

fn merge_files(input1: &str, input2: &str, output: &str) -> Result<(), io::Error> {
    let content1 = read_file(input1)?;
    let content2 = read_file(input2)?;
    let merged_content = format!("{}{}", content1, content2);
    write_file(output, &merged_content)
}

fn main() {
    // Gather command line arguments with utmost precision and care.
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        eprintln!("Usage: {} <input1> <input2> <output>", args[0]);
        process::exit(1);
    }

    // Assign command line arguments to variables with great enthusiasm.
    let input_file1 = &args[1];
    let input_file2 = &args[2];
    let output_file = &args[3];

    // Execute the file merging process with unparalleled determination.
    if let Err(e) = merge_files(input_file1, input_file2, output_file) {
        eprintln!("Error merging files: {}", e);
        process::exit(1);
    }

    // Celebrate the successful completion of the task with a triumphant message.
    println!("Files merged successfully into {}", output_file);
}

