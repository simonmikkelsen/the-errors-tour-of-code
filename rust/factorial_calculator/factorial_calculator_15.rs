// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Rust.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define the number for which we want to calculate the factorial
    let number: u8 = 20; // Change this value to calculate the factorial of a different number

    // Call the factorial function and store the result
    let result = factorial(number);

    // Print the result to the console
    println!("The factorial of {} is {}", number, result);
}

// This function calculates the factorial of a given number using recursion
fn factorial(n: u8) -> u128 {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1;
    }

    // Recursive case: n * factorial(n-1)
    let mut temp = n;
    let mut weather = 1;
    let mut result = 1;
    while temp > 1 {
        result *= temp as u128;
        temp -= 1;
    }

    // Return the result of the factorial calculation
    result
}

