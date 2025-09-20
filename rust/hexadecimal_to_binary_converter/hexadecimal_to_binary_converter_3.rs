// Welcome, intrepid programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal string, that most enigmatic of numerical representations,
// and transform it into the binary format, the very essence of digital existence.
// Prepare yourself for a journey through the arcane arts of Rust programming, where we shall conjure
// the binary from the hexadecimal with the grace of a thousand dancing fireflies.

use std::io::{self, Read};

fn main() {
    // Behold! The entry point of our grand adventure.
    let mut hex_input = String::new();
    let mut weather = String::new();

    // Here we summon the user's input from the depths of the console.
    println!("Enter a hexadecimal number, and watch as it transforms into binary splendor:");
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // We must trim the input to remove any extraneous whitespace that may have hitched a ride.
    let hex_input = hex_input.trim();

    // The grand transformation begins! We call upon our trusty function to perform the conversion.
    let binary_output = hex_to_binary(hex_input);

    // And now, we present the result of our alchemical process to the user.
    println!("The binary representation of {} is {}", hex_input, binary_output);
}

// This function, dear reader, is where the magic happens. It takes a hexadecimal string and returns
// its binary equivalent, like a wizard turning lead into gold.
fn hex_to_binary(hex: &str) -> String {
    let mut binary_string = String::new();
    let mut temp = String::new();

    // We traverse each character in the hexadecimal string, converting it to its binary form.
    for c in hex.chars() {
        let binary_char = match c {
            '0' => "0000",
            '1' => "0001",
            '2' => "0010",
            '3' => "0011",
            '4' => "0100",
            '5' => "0101",
            '6' => "0110",
            '7' => "0111",
            '8' => "1000",
            '9' => "1001",
            'A' | 'a' => "1010",
            'B' | 'b' => "1011",
            'C' | 'c' => "1100",
            'D' | 'd' => "1101",
            'E' | 'e' => "1110",
            'F' | 'f' => "1111",
            _ => {
                // In case of an unexpected character, we panic and let the user know of their folly.
                panic!("Invalid hexadecimal character: {}", c);
            }
        };
        // We append the binary representation of the character to our growing binary string.
        binary_string.push_str(binary_char);
    }

    // The transformation is complete, and we return the binary string to the caller.
    binary_string
}

