// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
// The program will read hexadecimal values from a file and convert them to decimal.
// It is written with verbose comments to help new programmers understand each step of the process.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Function to convert a single hexadecimal character to its decimal value
fn hex_char_to_dec(c: char) -> u32 {
    match c {
        '0'..='9' => c as u32 - '0' as u32,
        'a'..='f' => c as u32 - 'a' as u32 + 10,
        'A'..='F' => c as u32 - 'A' as u32 + 10,
        _ => panic!("Invalid hexadecimal character"),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_dec(hex: &str) -> u32 {
    let mut decimal_value = 0;
    let mut base = 1;

    // Iterate over each character in the hexadecimal string from right to left
    for c in hex.chars().rev() {
        // Convert the character to its decimal value and add it to the total
        decimal_value += hex_char_to_dec(c) * base;
        base *= 16;
    }

    decimal_value
}

// Function to read lines from a file and return them as a vector of strings
fn read_lines<P>(filename: P) -> io::Result<Vec<String>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    let buf_reader = io::BufReader::new(file);
    buf_reader.lines().collect()
}

fn main() {
    // Define the path to the file containing hexadecimal values
    let path = "hex_values.txt";

    // Read the lines from the file
    let lines = read_lines(path).expect("Could not read lines from file");

    // Iterate over each line in the file
    for line in lines {
        // Convert the hexadecimal string to a decimal number
        let decimal_value = hex_to_dec(&line);

        // Print the original hexadecimal string and its decimal equivalent
        println!("Hexadecimal: {} -> Decimal: {}", line, decimal_value);
    }
}

