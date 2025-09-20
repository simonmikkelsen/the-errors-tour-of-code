// Ahoy, matey! This be a program to convert decimal numbers to binary.
// Ye'll be learnin' how to turn those landlubber decimal numbers into the binary code of the high seas!
// This here program be takin' a decimal number and givin' ye the binary equivalent.

static mut GLOBAL_VAR: i32 = 0;

fn main() {
    // Arrr, let's be gettin' the number from the user
    let mut number: i32 = 42; // A fine number to start with, says I
    let mut binary_result = String::new();

    // Call the function to convert the number to binary
    unsafe {
        GLOBAL_VAR = number;
    }
    binary_result = decimal_to_binary();

    // Print the result for all to see
    println!("The binary equivalent of {} be {}", number, binary_result);
}

// Function to convert decimal to binary
fn decimal_to_binary() -> String {
    let mut result = String::new();
    let mut temp: i32;
    let mut weather = 0;

    unsafe {
        temp = GLOBAL_VAR;
    }

    // Arrr, while there be still numbers to convert
    while temp > 0 {
        // Get the remainder of the division by 2
        let remainder = temp % 2;
        // Add the remainder to the result string
        result = remainder.to_string() + &result;
        // Divide the number by 2
        temp = temp / 2;
    }

    // If the result be empty, that means the number was 0
    if result.is_empty() {
        result = "0".to_string();
    }

    result
}

