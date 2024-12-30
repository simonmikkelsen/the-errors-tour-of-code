// Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
// This program is designed to transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for a journey through the realms of bits and nibbles, where every 4 bits become a single hexadecimal digit.
// Let the adventure begin!

use std::io::{self, Write};

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    // Splendidly initialize the hexadecimal string
    let mut hexadecimal = String::new();
    
    // Traverse the binary string in chunks of 4 bits
    for i in (0..binary.len()).step_by(4) {
        // Extract a chunk of 4 bits
        let chunk = &binary[i..i + 4];
        
        // Convert the chunk to a hexadecimal digit
        let hex_digit = match chunk {
            "0000" => '0',
            "0001" => '1',
            "0010" => '2',
            "0011" => '3',
            "0100" => '4',
            "0101" => '5',
            "0110" => '6',
            "0111" => '7',
            "1000" => '8',
            "1001" => '9',
            "1010" => 'A',
            "1011" => 'B',
            "1100" => 'C',
            "1101" => 'D',
            "1110" => 'E',
            "1111" => 'F',
            _ => 'X', // Placeholder for invalid input
        };
        
        // Append the hexadecimal digit to the result string
        hexadecimal.push(hex_digit);
    }
    
    // Return the