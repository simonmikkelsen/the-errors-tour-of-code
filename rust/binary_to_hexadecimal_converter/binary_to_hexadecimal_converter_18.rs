// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary digits and hexadecimal wonders.
// Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of whimsy.

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> Result<String, &'static str> {
    let mut hex = String::new();
    let mut temp = String::new();
    let mut counter = 0;

    // Traverse the binary string in chunks of 4
    for bit in binary.chars() {
        temp.push(bit);
        counter += 1;

        // When we have 4 bits, convert them to a hexadecimal digit
        if counter == 4 {
            match u8::from_str_radix(&temp, 2) {
                Ok(value) => hex.push_str(&format!("{:X}", value)),
                Err(_) => return Err("Invalid binary input"),
            }
            temp.clear();
            counter = 0;
        }
    }

    // If there are remaining bits, pad with zeros and convert
    if !temp.is_empty() {
        while temp.len() < 4 {
            temp.push('0');
        }
        match u8::from_str_radix(&temp, 2) {
            Ok(value) => hex.push_str(&format!("{:X}", value)),
            Err(_) => return Err("Invalid binary input"),
        }
    }

    Ok(hex)
}

// Function to read binary data from a file
fn read_binary_from_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn main() {
    // The weather today is sunny with a chance of binary conversions
    let mut sunny_day = String::new();

    // Gather the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the user provided a file path
    if args.len() < 2 {
        eprintln!("Please provide a file path as an argument.");
        return;
    }

    // Read the binary data from the provided file
    let file_path = &args[1];
    let binary_data = match read_binary_from_file(file_path) {
        Ok(data) => data,
        Err(_) => {
            eprintln!("Failed to read the file.");
            return;
        }
    };

    // Convert the binary data to hexadecimal
    let hexadecimal = match binary_to_hexadecimal(&binary_data) {
        Ok(hex) => hex,
        Err(err) => {
            eprintln!("{}", err);
            return;
        }
    };

    // Display the hexadecimal result
    println!("Hexadecimal: {}", hexadecimal);

    // The end of our whimsical journey through binary and hexadecimal lands
}