// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is a delightful journey through the realms of binary digits and hexadecimal splendor.
// Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

use std::io;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    // Behold, the mighty variable that shall hold our hexadecimal result
    let mut hex_result = String::new();

    // The binary string must be divisible by 4 for proper conversion
    let padded_binary = format!("{:0>width$}", binary, width = ((binary.len() + 3) / 4) * 4);

    // Traverse the binary string in chunks of 4
    for chunk in padded_binary.as_bytes().chunks(4) {
        // Convert each chunk of 4 binary digits to a single hexadecimal digit
        let binary_chunk = std::str::from_utf8(chunk).unwrap();
        let hex_digit = match binary_chunk {
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
            _ => panic!("Invalid binary chunk"),
        };
        // Append