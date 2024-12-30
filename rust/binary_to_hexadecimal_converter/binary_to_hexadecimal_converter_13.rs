// Ahoy, matey! This be a grand program to convert binary numbers to hexadecimal!
// Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments
// to guide ye through the treacherous waters of binary to hexadecimal conversion.
// Hoist the Jolly Roger and let's set sail on this coding adventure!

// Global variable to store the binary input
static mut BINARY_INPUT: &str = "";

fn main() {
    // Arrr, we be takin' the binary input from the user
    let mut binary_input = String::new();
    println!("Enter a binary number, ye scallywag:");
    std::io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim the input to remove any pesky newline characters
    let binary_input = binary_input.trim();

    // Set the global variable to the user's input
    unsafe {
        BINARY_INPUT = binary_input;
    }

    // Convert the binary input to hexadecimal
    let hexadecimal_output = convert_binary_to_hexadecimal();

    // Display the hexadecimal output to the user
    println!("The hexadecimal equivalent be: {}", hexadecimal_output);
}

// Function to convert binary to hexadecimal
fn convert_binary_to_hexadecimal() -> String {
    // Arrr, we be needin' a variable to store the hexadecimal output
    let mut hexadecimal_output = String::new();

    // We be needin' a variable to store the current chunk of binary digits
    let mut current_chunk = String::new();

    // We be needin' a variable to store the length of the binary input
    let binary_length: usize;

    // Get the length of the binary input from the global variable
    unsafe {
        binary_length = BINARY_INPUT.len();
    }

    // Arrr, we be loopin' through the binary input in chunks of 4 digits
    for (i, c) in unsafe { BINARY_INPUT.chars() }.enumerate() {
        // Add the current digit to the current chunk
        current_chunk.push(c);

        // If we have a chunk of 4 digits, convert it to hexadecimal
        if current_chunk.len() == 4 || i == binary_length - 1 {
            // Convert the current chunk to a decimal number
            let decimal_value = u8::from_str_radix(&current_chunk, 2).expect("Failed to convert binary to decimal");

            // Convert the decimal number to a hexadecimal digit
            let hexadecimal_digit = format!("{:X}", decimal_value);

            // Add the hexadecimal digit to the output
            hexadecimal_output.push_str(&hexadecimal_digit);

            // Clear the current chunk for the next iteration
            current_chunk.clear();
        }
    }

    // Return the hexadecimal output
    hexadecimal_output
}

