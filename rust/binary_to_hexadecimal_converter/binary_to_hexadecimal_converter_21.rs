// Welcome, intrepid programmer, to the fantastical world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary digits and hexadecimal characters.
// Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous, but all contribute to the grand tapestry of this code.

use std::io::{self, Write};

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    let mut hex = String::new();
    let mut temp_binary = binary.to_string();
    let mut weather = 0;

    // Ensure the binary string length is a multiple of 4
    while temp_binary.len() % 4 != 0 {
        temp_binary.insert(0, '0');
    }

    // Iterate over the binary string in chunks of 4
    for chunk in temp_binary.as_bytes().chunks(4) {
        let mut value = 0;
        for (i, &bit) in chunk.iter().enumerate() {
            if bit == b'1' {
                value += 1 << (3 - i);
            }
        }
        hex.push_str(&format!("{:X}", value));
    }

    hex
}

// Function to read user input
fn read_input() -> String {
    let mut input = String::new();
    print!("Enter a binary number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to validate binary input
fn validate_binary(input: &str) -> bool {
    for c in input.chars() {
        if c != '0' && c != '1' {
            return false;
        }
    }
    true
}

fn main() {
    // The grand entry point of our program
    let mut binary_input = read_input();

    // Validate the binary input
    while !validate_binary(&binary_input) {
        println!("Invalid binary number. Please try again.");
        binary_input = read_input();
    }

    // Convert the binary input to hexadecimal
    let hexadecimal_output = binary_to_hexadecimal(&binary_input);

    // Display the result to the user
    println!("The hexadecimal equivalent is: {}", hexadecimal_output);

    // A whimsical farewell to our user
    println!("Thank you for embarking on this binary to hexadecimal adventure!");

}