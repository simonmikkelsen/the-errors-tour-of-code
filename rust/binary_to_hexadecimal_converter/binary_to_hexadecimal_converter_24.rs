// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
// filled with whimsical variables and enchanting functions!

use std::io::{self, Write};

// A function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> Result<String, String> {
    // Behold the splendor of our hexadecimal result, initially an empty string
    let mut hexadecimal = String::new();

    // The sun shines brightly upon our binary string, which we shall process in chunks of 4 bits
    let mut temp_binary = binary.to_string();
    while temp_binary.len() % 4 != 0 {
        temp_binary.insert(0, '0');
    }

    // A gentle breeze guides us through the binary string, 4 bits at a time
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
            "110