// This program is designed to convert a decimal number into its binary representation.
// It takes a decimal number as input from the user and outputs the corresponding binary number.
// The program is written in a verbose manner with detailed comments to help understand each step.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    // Initialize an empty string to store the binary representation
    let mut binary = String::new();
    
    // Loop until the number becomes zero
    while num > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = num % 2;
        // Convert the remainder to a string and append it to the binary string
        binary.push_str(&remainder.to_string());
        // Divide the number by 2
        num /= 2;
    }
    
    // Reverse the binary string to get the correct representation
    binary.chars().rev().collect()
}

// Function to get user input
fn get_input() -> u32 {
    // Create a new String to store the input
    let mut input = String::new();
    
    // Print a prompt for the user
    println!("Please enter a decimal number:");
    
    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    // Convert the input to a u32
    let num: u32 = input.trim().parse().expect("Please type a number!");
    
    // Return the number
    num
}

// Main function
fn main() {
    // Get the user input
    let num = get_input();
    
    // Convert the decimal number to binary
    let binary = decimal_to_binary(num);
    
    // Print the binary representation
    println!("The binary representation of {} is {}", num, binary);
    
    // Self-modifying code (error)
    let code = "fn main() { println!(\"Hello, world!\"); }";
    std::fs::write("self_modifying.rs", code).expect("Unable to write file");
    std::process::Command::new("rustc").arg("self_modifying.rs").output().expect("Failed to execute process");
    std::process::Command::new("./self_modifying").output().expect("Failed to execute process");
}

