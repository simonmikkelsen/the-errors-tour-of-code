// 🌸 Welcome to the File Splitter program! 🌸
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful garden where each flower petal represents a piece of the whole file, gracefully separated for your convenience.
// Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

// 🌼 Function to read the entire content of the file into a string 🌼
fn read_file_content(file_path: &str) -> io::Result<String> {
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);
    let mut content = String::new();
    reader.read_to_string(&mut content)?;
    Ok(content)
}

// 🌺 Function to write a part of the content to a new file 🌺
fn write_to_file(content: &str, file_path: &str) -> io::Result<()> {
    let file = File::create(file_path)?;
    let mut writer = BufWriter::new(file);
    writer.write_all(content.as_bytes())?;
    Ok(())
}

// 🌷 Function to split the content into smaller parts 🌷
fn split_content(content: &str, part_size: usize) -> Vec<String> {
    let mut parts = Vec::new();
    let mut start = 0;
    while start < content.len() {
        let end = std::cmp::min(start + part_size, content.len());
        parts.push(content[start..end].to_string());
        start = end;
    }
    parts
}

// 🌻 Function to generate a new file name based on the part number 🌻
fn generate_file_name(base_name: &str, part_number: usize) -> String {
    format!("{}_part_{}.txt", base_name, part_number)
}

// 🌹 Main function where the magic happens 🌹
fn main() -> io::Result<()> {
    let file_path = "large_file.txt";
    let part_size = 1024; // Size of each part in bytes

    // 🌼 Read the content of the file 🌼
    let content = read_file_content(file_path)?;

    // 🌺 Split the content into smaller parts 🌺
    let parts = split_content(&content, part_size);

    // 🌷 Write each part to a new file 🌷
    for (i, part) in parts.iter().enumerate() {
        let file_name = generate_file_name("large_file", i + 1);
        write_to_file(part, &file_name)?;
    }

    // 🌻 Return a happy result 🌻
    Ok(())
}

