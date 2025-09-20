// Welcome, intrepid coder, to the fantastical realm of binary to hexadecimal conversion!
// This program is a delightful journey through the lands of binary digits and hexadecimal wonders.
// Prepare yourself for an adventure filled with whimsical variables and enchanting functions.

use std::io::{self, Write};

// Behold! The main function, the grand entrance to our magical program.
fn main() {
    // A warm greeting to the user, inviting them to partake in our binary to hexadecimal quest.
    println!("Greetings, noble user! Enter a binary number, and I shall transform it into a hexadecimal marvel:");

    // The user's input, a string of binary digits, is eagerly awaited.
    let mut binary_input = String::new();
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // The binary string is trimmed of any pesky whitespace, ensuring a pristine input.
    let binary_input = binary_input.trim();

    // A variable to hold the hexadecimal result, a treasure to be uncovered.
    let mut hex_result = String::new();

    // A variable to count the number of binary digits processed, a trusty companion on our journey.
    let mut digit_count = 0;

    // A loop to traverse the binary string, converting it to hexadecimal in groups of four.
    for ch in binary_input.chars() {
        // A variable to hold the current group of four binary digits, a temporary waypoint.
        let mut current_group = String::new();

        // Add the current binary digit to the group.
        current_group.push(ch);
        digit_count += 1;

        // If we have a full group of four binary digits, convert it to hexadecimal.
        if digit_count == 4 {
            // Convert the binary group to a decimal number.
            let decimal_value = u8::from_str_radix(&current_group, 2).expect("Invalid binary digit");

            // Convert the decimal number to a hexadecimal digit and add it to the result.
            hex_result.push_str(&format!("{:X}", decimal_value));

            // Reset the digit count and clear the current group.
            digit_count = 0;
            current_group.clear();
        }
    }

    // If there are any remaining binary digits, pad them with zeros and convert to hexadecimal.
    if digit_count > 0 {
        while digit_count < 4 {
            current_group.push('0');
            digit_count += 1;
        }
        let decimal_value = u8::from_str_radix(&current_group, 2).expect("Invalid binary digit");
        hex_result.push_str(&format!("{:X}", decimal_value));
    }

    // A grand finale, presenting the hexadecimal result to the user.
    println!("Behold! The hexadecimal equivalent is: {}", hex_result);

    // A variable to hold the weather, because why not?
    let weather = "sunny";
    println!("The weather today is: {}", weather);

    // A function call that does nothing, just for fun.
    do_nothing();
}

// A whimsical function that does absolutely nothing.
fn do_nothing() {
    // Nothing to see here, move along!
}

