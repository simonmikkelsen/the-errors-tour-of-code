// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is designed to take a binary string and transform it into its hexadecimal counterpart.
// Along the way, you will encounter a plethora of variables and functions, each with its own unique charm.
// Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

use std::io::{self, Write};

// A function to convert a binary string to a hexadecimal string
fn binary_to_hex(binary: &str) -> Result<String, String> {
    // First, we must ensure that the binary string is valid
    if !binary.chars().all(|c| c == '0' || c == '1') {
        return Err("Invalid binary string".to_string());
    }

    // Next, we shall pad the binary string with leading zeros to make its length a multiple of 4
    let mut padded_binary = binary.to_string();
    while padded_binary.len() % 4 != 0 {
        padded_binary.insert(0, '0');
    }

    // Now, we shall create a mapping of binary quartets to their hexadecimal counterparts
    let mut hex_string = String::new();
    let binary_to_hex_map = [
        ("0000", '0'), ("0001", '1'), ("0010", '2'), ("0011", '3'),
        ("0100", '4'), ("0101", '5'), ("0110", '6'), ("0111", '7'),
        ("1000", '8'), ("1001", '9'), ("1010", 'A'), ("1011", 'B'),
        ("1100", 'C'), ("1101", 'D'), ("1110", 'E'), ("1111", 'F'),
    ];

    // We shall now traverse the padded binary string in chunks of 4
    for chunk in padded_binary.as_bytes().chunks(4) {
        let quartet = std::str::from_utf8(chunk).unwrap();
        for &(bin, hex) in &binary_to_hex_map {
            if bin == quartet {
                hex_string.push(hex);
                break;
            }
        }
    }

    // Finally, we return the hexadecimal string
    Ok(hex_string)
}

// A function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    print!("Enter a binary string: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().to_string()
}

// The main function, where the magic happens
fn main() {
    // We shall read the binary string from the user
    let binary_string = read_input();

    // Convert the binary string to hexadecimal
    match binary_to_hex(&binary_string) {
        Ok(hex_string) => println!("Hexadecimal: {}", hex_string),
        Err(e) => println!("Error: {}", e),
    }

    // A whimsical farewell to our dear user
    println!("Thank you for using the binary to hexadecimal converter!");
}

