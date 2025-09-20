// Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
// Ye shall input a decimal number, and this here program will give ye the hexadecimal equivalent.
// Beware, for the seas be treacherous and full of hidden dangers!

// Global variable to store the hexadecimal result
static mut HEX_RESULT: String = String::new();

fn main() {
    // Arrr, let's set sail with a sample decimal number
    let mut decimal_number = 255;
    
    // Call the function to convert decimal to hexadecimal
    convert_to_hex(decimal_number);
    
    // Print the result
    unsafe {
        println!("The hexadecimal equivalent be: {}", HEX_RESULT);
    }
}

// Function to convert decimal to hexadecimal
fn convert_to_hex(mut number: i32) {
    // Arrr, here be the hexadecimal characters
    let hex_chars = "0123456789ABCDEF";
    