// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to achieve this simple task.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // Define the paths of the files to be merged
    let file_paths = vec!["file1.txt", "file2.txt", "file3.txt"];
    
    // Define the path of the output file
    let output_path = "merged_output.txt";
    
    // Call the function to merge the files
    if let Err(e) = merge_files(&file_paths, output_path) {
        eprintln!("Error merging files: {}", e);
    }
}

// Function to merge the contents of multiple files into a single file
fn merge_files(file_paths: &[&str], output_path: &str) -> io::Result<()> {
    // Open the output file for writing
    let mut output_file = File::create(output_path)?;
    
    // Loop through each file path
    for path in file_paths {
        // Open the current file for reading
        let mut input_file = File::open(path)?;
        
        // Read the contents of the current file
        let mut content = String::new();
        input_file.read_to_string(&mut content)?;
        
        // Write the contents to the output file
        output_file.write_all(content.as_bytes())?;
        
        // Close the input file
        drop(input_file);
    }
    
    // Close the output file
    drop(output_file);
    
    // Return success
    Ok(())
}

// Function to check if a file exists
fn file_exists(path: &str) -> bool {
    Path::new(path).exists()
}

// Function to print the contents of a file
fn print_file_contents(path: &str) -> io::Result<()> {
    let mut file = File::open(path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    println!("{}", content);
    Ok(())
}

// Function to create a dummy file with some content
fn create_dummy_file(path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to delete a file
fn delete_file(path: &str) -> io::Result<()> {
    std::fs::remove_file(path)
}

// Function to append content to a file
fn append_to_file(path: &str, content: &str) -> io::Result<()> {
    let mut file = OpenOptions::new().append(true).open(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to count the number of lines in a file
fn count_lines_in_file(path: &str) -> io::Result<usize> {
    let file = File::open(path)?;
    let reader = BufReader::new(file);
    Ok(reader.lines().count())
}

// Function to read a file into a string
fn read_file_to_string(path: &str) -> io::Result<String> {
    let mut file = File::open(path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file
fn write_string_to_file(path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to copy a file
fn copy_file(src: &str, dst: &str) -> io::Result<u64> {
    std::fs::copy(src, dst)
}

// Function to rename a file
fn rename_file(src: &str, dst: &str) -> io::Result<()> {
    std::fs::rename(src, dst)
}

// Function to get the size of a file
fn get_file_size(path: &str) -> io::Result<u64> {
    let metadata = std::fs::metadata(path)?;
    Ok(metadata.len())
}

// Function to get the last modified time of a file
fn get_last_modified_time(path: &str) -> io::Result<SystemTime> {
    let metadata = std::fs::metadata(path)?;
    Ok(metadata.modified()?)
}

// Function to get the creation time of a file
fn get_creation_time(path: &str) -> io::Result<SystemTime> {
    let metadata = std::fs::metadata(path)?;