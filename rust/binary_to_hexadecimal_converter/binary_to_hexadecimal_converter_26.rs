// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts with the grace of a thousand dancing butterflies.
// Prepare yourself for an adventure filled with verbose comments and an abundance of variables and functions!

use std::io;
use rand::Rng;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> Result<String, &'static str> {
    // Behold! The grand conversion begins!
    let mut hex_string = String::new();
    let mut temp_binary = binary.to_string();

    // Ensure the binary string length is a multiple of 4
    while temp_binary.len() % 4 != 0 {
        temp_binary.insert(0, '0');
    }

    // Traverse the binary string in chunks of 4
    for chunk in temp_binary.as_bytes().chunks(4) {
        let chunk_str = std::str::from_utf8(chunk).unwrap();
        let hex_digit = match chunk_str {
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
            "111