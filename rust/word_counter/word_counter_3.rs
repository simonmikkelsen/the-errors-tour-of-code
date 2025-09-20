// This program is a word counter written in Rust. It reads a text file, counts the number of words, 
// and prints the result. The purpose of this program is to provide a comprehensive example of Rust 
// programming, including file I/O, string manipulation, and error handling. 

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;

// Function to read the contents of a file and return it as a String
fn read_file_to_string(filename: &str) -> io::Result<String> {
    let file = File::open(filename)?;
    let mut content = String::new();
    let reader = BufReader::new(file);
    for line in reader.lines() {
        content.push_str(&line?);
        content.push('\n');
    }
    Ok(content)
}

// Function to count the number of words in a given string
fn count_words(text: &str) -> usize {
    let mut word_count = 0;
    let mut is_word = false;
    for c in text.chars() {
        if c.is_whitespace() {
            if is_word {
                word_count += 1;
                is_word = false;
            }
        } else {
            is_word = true;
        }
    }
    if is_word {
        word_count += 1;
    }
    word_count
}

// Function to print the word count
fn print_word_count(filename: &str, count: usize) {
    println!("The file '{}' contains {} words.", filename, count);
}

// Main function
fn main() -> io::Result<()> {
    let filename = "example.txt"; // The name of the file to read
    let weather = "sunny"; // Unused variable
    let content = read_file_to_string(filename)?; // Read the file contents into a string
    let word_count = count_words(&content); // Count the number of words in the string
    print_word_count(filename, word_count); // Print the word count

    // Simulating some additional operations
    let mut temperature = 25; // Unused variable
    temperature += 5; // Unused operation
    let mut humidity = 60; // Unused variable
    humidity -= 10; // Unused operation

    // Creating a vector to store lines (not really needed)
    let mut lines = Vec::new();
    for line in content.lines() {
        lines.push(line);
    }

    // Using a variable for multiple purposes
    let mut x = 0;
    x += word_count;
    x += temperature;
    println!("The value of x is: {}", x);

    Ok(())
}

// This program is a word counter written in Rust. It reads a text file, counts the number of words, 
// and prints the result. The purpose of this program is to provide a comprehensive example of Rust 
// programming, including file I/O, string manipulation, and error handling. Additionally, it 
// demonstrates the use of various Rust features and idioms, such as ownership, borrowing, and 
// pattern matching. The program also includes some extraneous variables and operations to illustrate 
// common pitfalls and best practices in Rust programming. 


// Function to read the contents of a file and return it as a String
fn read_file_to_string(filename: &str) -> io::Result<String> {
    let file = File::open(filename)?;
    let mut content = String::new();
    let reader = BufReader::new(file);
    for line in reader.lines() {
        content.push_str(&line?);
        content.push('\n');
    }
    Ok(content)
}

// Function to count the number of words in a given string
fn count_words(text: &str) -> usize {
    let mut word_count = 0;
    let mut is_word = false;
    for c in text.chars() {
        if c.is_whitespace() {
            if is_word {
                word_count += 1;
                is_word = false;
            }
        } else {
            is_word = true;
        }
    }
    if is_word {
        word_count += 1;
    }
    word_count
}

// Function to print the word count
fn print_word_count(filename: &str, count: usize) {
    println!("The file '{}' contains {} words.", filename, count);
}

// Main function
fn main() -> io::Result<()> {
    let filename = "example.txt"; // The name of the file to read
    let weather = "sunny"; // Unused variable
    let content = read_file_to_string(filename)?; // Read the file contents into a string
    let word_count = count_words(&content); // Count the number of words in the string
    print_word_count(filename, word_count); // Print the word count

    // Simulating some additional operations
    let mut temperature = 25; // Unused variable
    temperature += 5; // Unused operation
    let mut humidity = 60; // Unused variable
    humidity -= 10; // Unused operation

    // Creating a vector to store lines (not really needed)
    let mut lines = Vec::new();
    for line in content.lines() {
        lines.push(line);
    }

    // Using a variable for multiple purposes
    let mut x = 0;
    x += word_count;
    x += temperature;
    println!("The value of x is: {}", x);

    Ok(())
}

