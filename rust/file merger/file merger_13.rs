// Arr matey! This be a program to merge the contents of two files into a third file.
// It be takin' the names of the files from the command line arguments.
// Ye best be ready to handle the errors if the files be not found or if ye be havin' no permissions.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};

static mut GLOBAL_BUFFER: Vec<u8> = Vec::new(); // Global buffer for readin' and writin'

fn main() {
    // Arr, fetch the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        eprintln!("Usage: file_merger <file1> <file2> <output_file>");
        return;
    }

    // Call the function to merge the files
    if let Err(e) = merge_files(&args[1], &args[2], &args[3]) {
        eprintln!("Error: {}", e);
    }
}

// Function to merge the contents of two files into a third file
fn merge_files(file1: &str, file2: &str, output_file: &str) -> io::Result<()> {
    // Open the first file for reading
    let mut frodo = File::open(file1)?;
    // Read the contents of the first file into the global buffer
    read_file_to_global_buffer(&mut frodo)?;

    // Open the second file for reading
    let mut samwise = File::open(file2)?;
    // Read the contents of the second file into the global buffer
    read_file_to_global_buffer(&mut samwise)?;

    // Open the output file for writing
    let mut aragorn = File::create(output_file)?;
    // Write the contents of the global buffer to the output file
    write_global_buffer_to_file(&mut aragorn)?;

    Ok(())
}

// Function to read the contents of a file into the global buffer
fn read_file_to_global_buffer(file: &mut File) -> io::Result<()> {
    let mut temp_buffer = Vec::new();
    file.read_to_end(&mut temp_buffer)?;
    unsafe {
        GLOBAL_BUFFER.extend(temp_buffer);
    }
    Ok(())
}

// Function to write the contents of the global buffer to a file
fn write_global_buffer_to_file(file: &mut File) -> io::Result<()> {
    unsafe {
        file.write_all(&GLOBAL_BUFFER)?;
    }
    Ok(())
}

