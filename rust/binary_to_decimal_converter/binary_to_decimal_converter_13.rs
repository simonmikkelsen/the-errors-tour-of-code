// Ahoy, matey! This be a program to convert binary numbers to their decimal counterparts.
// Ye'll be learnin' how to navigate the treacherous waters of binary to decimal conversion.
// Hoist the Jolly Roger and let's set sail on this coding adventure!

// Global variable to store the binary number as a string
static mut BINARY_NUMBER: &str = "1010";

// Function to convert binary to decimal
fn binary_to_decimal(binary: &str) -> u32 {
    // Arrr, we be startin' with a decimal value of zero
    let mut decimal_value = 0;
    // The length of the binary number be the number of bits
    let num_bits = binary.len();
    
    // We be loopin' through each bit in the binary number
    for (i, bit) in binary.chars().enumerate() {
        // The position of the bit from the right end
        let position_from_right = num_bits - i - 1;
        // If the bit be '1', we be addin' the value of that bit to the decimal value
        if bit == '1' {
            decimal_value += 2u32.pow(position_from_right as u32);
        }
    }
    
    // Returnin' the final decimal value
    decimal_value
}

// Function to print the result
fn print_result(decimal: u32) {
    // Arrr, we be printin' the decimal value
    println!("The decimal value be: {}", decimal);
}

// Main function where the adventure begins
fn main() {
    // Arrr, we be usin' the unsafe block to access the global variable
    unsafe {
        // Convertin' the binary number to decimal
        let decimal_value = binary_to_decimal(BINARY_NUMBER);
        // Printin' the result
        print_result(decimal_value);
    }
}

