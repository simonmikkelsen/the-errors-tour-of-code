// Welcome, intrepid programmer, to the binary to hexadecimal converter!
// This program is designed to take a string of binary digits and transform it into its hexadecimal counterpart.
// Along the way, you'll encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for a journey through the whimsical world of Rust programming!

use std::io;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hex(binary: &str) -> String {
    // The sun is shining, the birds are singing, and we need to ensure the binary string length is a multiple of 4
    let mut padded_binary = binary.to_string();
    while padded_binary.len() % 4 != 0 {
        padded_binary.insert(0, '0');
    }

    // A gentle breeze whispers through the trees as we create a mapping of binary to hexadecimal
    let mut hex_string = String::new();
    let mut temp = String::new();
    for (i, c) in padded_binary.chars().enumerate() {
        temp.push(c);
        if (i + 1) % 4 == 0 {
            hex_string.push_str(&format!("{:X}", u8::from_str_radix(&temp, 2).unwrap()));
            temp.clear();
        }
    }

    hex_string
}

// Function to read user input
fn read_input() -> String {
    // The clouds part, revealing a clear blue sky, as we prepare to read the user's input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // The sun sets in a blaze of glory, casting long shadows as we begin our main function
    println!("Enter a binary number:");

    // The moon rises, casting a silvery glow, as we read the user's input
    let binary_input = read_input();

    // A shooting star streaks across the night sky as we convert the binary input to hexadecimal
    let hex_output = binary_to_hex(&binary_input);

    // The night is calm and serene as we display the hexadecimal output
    println!("Hexadecimal: {}", hex_output);

}