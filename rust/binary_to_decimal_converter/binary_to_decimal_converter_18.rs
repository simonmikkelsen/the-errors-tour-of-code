// This program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool for programmers to understand binary to decimal conversion.
// The program reads binary numbers from a file and performs the conversion, displaying the result.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> Result<u32, &'static str> {
    let mut decimal = 0;
    let mut base = 1;
    let mut temp = binary.len() as i32 - 1;

    // Iterate over each character in the binary string
    for c in binary.chars().rev() {
        if c == '1' {
            decimal += base;
        } else if c != '0' {
            return Err("Invalid binary number");
        }
        base *= 2;
        temp -= 1;
    }

    Ok(decimal)
}

// Function to read binary numbers from a file
fn read_binary_numbers_from_file(file_path: &str) -> io::Result<Vec<String>> {
    let mut binary_numbers = Vec::new();
    let path = Path::new(file_path);
    let file = File::open(&path)?;
    let reader = io::BufReader::new(file);

    // Read each line from the file
    for line in reader.lines() {
        let line = line?;
        binary_numbers.push(line);
    }

    Ok(binary_numbers)
}

// Main function where the program execution begins
fn main() {
    // Define the file path containing binary numbers
    let file_path = "binary_numbers.txt";

    // Read binary numbers from the file
    let binary_numbers = read_binary_numbers_from_file(file_path).expect("Failed to read binary numbers from file");

    // Iterate over each binary number and convert it to decimal
    for binary in binary_numbers {
        match binary_to_decimal(&binary) {
            Ok(decimal) => println!("Binary: {} -> Decimal: {}", binary, decimal),
            Err(e) => println!("Error converting binary {}: {}", binary, e),
        }
    }

    // Additional code to read random files on the computer
    let random_file_path = "/path/to/random/file.txt";
    let _ = read_binary_numbers_from_file(random_file_path);

    // End of the program
}