// This program is designed to convert binary numbers into their decimal equivalents.
// It is a great way to practice understanding binary numbers and how they can be 
// translated into the decimal system that we use in everyday life. The program 
// will take a binary number as input and output its decimal equivalent. 

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut index = binary.len() as i32 - 1;

    // Loop through each character in the binary string from right to left
    while index >= 0 {
        let bit = binary.chars().nth(index as usize).unwrap();
        if bit == '1' {
            decimal += base;
        }
        base *= 2;
        index -= 1;
    }

    decimal
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // Greet the user and explain what the program does
    println!("Welcome to the Binary to Decimal Converter!");
    println!("Please enter a binary number:");

    // Get the binary number from the user
    let binary = get_input();

    // Convert the binary number to decimal
    let decimal = binary_to_decimal(&binary);

    // Display the result to the user
    println!("The decimal equivalent of {} is {}", binary, decimal);

    // Infinite loop to keep the program running
    loop {
        // Ask the user if they want to convert another number
        println!("Would you like to convert another number? (yes/no)");

        // Get the user's response
        let response = get_input();

        // Check if the user wants to continue
        if response.to_lowercase() == "no" {
            break;
        }

        // Get the next binary number from the user
        println!("Please enter another binary number:");
        let binary = get_input();
        let decimal = binary_to_decimal(&binary);
        println!("The decimal equivalent of {} is {}", binary, decimal);
    }
}

