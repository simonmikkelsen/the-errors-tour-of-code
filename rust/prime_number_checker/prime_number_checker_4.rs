// This program is a prime number checker written in Rust.
// It is designed to help programmers understand how to implement
// a prime number checker and to practice their Rust programming skills.
// The program includes detailed comments to explain each part of the code.

fn main() {
    // Define the number to check
    let number_to_check = 29;

    // Call the function to check if the number is prime
    let is_prime = check_prime(number_to_check);

    // Print the result
    if is_prime {
        println!("{} is a prime number.", number_to_check);
    } else {
        println!("{} is not a prime number.", number_to_check);
    }
}

// Function to check if a number is prime
fn check_prime(number: u32) -> bool {
    // Handle special cases
    if number <= 1 {
        return false;
    }
    if number <= 3 {
        return true;
    }

    // Check for divisibility by 2 and 3
    if number % 2 == 0 || number % 3 == 0 {
        return false;
    }

    // Initialize variables for the loop
    let mut i = 5;
    let mut weather = 0;

    // Loop to check for factors
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false;
        }
        i += 6;
        weather += 1; // Unnecessary variable usage
    }

    // Return true if no factors were found
    true
}

