// Welcome, intrepid coder, to the magnificent world of hexadecimal to binary conversion!
// This program, a veritable tapestry of logic and computation, will transform hexadecimal strings into their binary counterparts.
// Prepare yourself for a journey through the realms of Rust, where variables dance and functions sing.

use std::io;

// Behold the main function, the grand entrance to our program's enchanted forest.
fn main() {
    // Greet the user with a message as warm as a summer breeze.
    println!("Enter a hexadecimal number, and watch as it transforms into binary!");

    // Create a mutable string to hold the user's input, like a chalice awaiting ambrosia.
    let mut hex_input = String::new();

    // Summon the user's input from the depths of the console.
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any extraneous whitespace, like a gardener pruning a rose bush.
    let hex_input = hex_input.trim();

    // Convert the hexadecimal string to a binary string, a metamorphosis akin to a caterpillar becoming a butterfly.
    let binary_output = hex_to_binary(hex_input);

    // Display the binary string to the user, a revelation as dazzling as a sunrise.
    println!("The binary representation is: {}", binary_output);
}

// This function, a paragon of transformation, converts a hexadecimal string to a binary string.
fn hex_to_binary(hex: &str) -> String {
    // Create a mutable string to hold the binary output, like a canvas awaiting a masterpiece.
    let mut binary_output = String::new();

    // Iterate over each character in the hexadecimal string, like a poet savoring each word.
    for c in hex.chars() {
        // Convert the character to its binary equivalent, a process as intricate as alchemy.
        let binary_segment = match c {
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
                // Handle any invalid characters with a message as stern as a headmaster's reprimand.
                println!("Invalid hexadecimal character: {}", c);
                return String::new();
            }
        };

        // Append the binary segment to the binary output, like a jeweler adding gems to a necklace.
        binary_output.push_str(binary_segment);
    }

    // Return the binary output, a string as radiant as a full moon.
    binary_output
}

