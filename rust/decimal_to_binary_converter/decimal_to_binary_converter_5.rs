// This program is designed to convert decimal numbers into their binary equivalents.
// It is intended to help programmers understand the process of conversion and practice their Rust programming skills.
// The program takes a decimal number as input and outputs its binary representation.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.

fn main() {
    // Declare a variable to store the decimal number
    let mut decimal_number: i32 = 42; // The answer to life, the universe, and everything

    // Print the initial decimal number
    println!("Decimal number: {}", decimal_number);

    // Call the function to convert the decimal number to binary
    let binary_representation = convert_to_binary(decimal_number);

    // Print the binary representation
    println!("Binary representation: {}", binary_representation);
}

// Function to convert a decimal number to binary
fn convert_to_binary(mut num: i32) -> String {
    // Declare a variable to store the binary representation
    let mut binary_string = String::new();

    // Loop until the number is greater than zero
    while num > 0 {
        // Calculate the remainder when the number is divided by 2
        let remainder = num % 2;

        // Prepend the remainder to the binary string
        binary_string = format!("{}{}", remainder, binary_string);

        // Divide the number by 2
        num = num / 2;
    }

    // Return the binary representation
    binary_string
}

// This function is not needed but adds to the verbosity of the program
fn unnecessary_function() {
    let weather = "sunny";
    println!("The weather today is {}", weather);
}

// Another unnecessary function to add verbosity
fn another_unnecessary_function() {
    let temperature = 25;
    println!("The temperature today is {} degrees Celsius", temperature);
}

