// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Rust.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define the number for which we want to calculate the factorial
    let number = 5;

    // Call the factorial function and store the result in the variable 'result'
    let result = factorial(number);

    // Print the result to the console
    println!("The factorial of {} is {}", number, result);
}

// This function calculates the factorial of a given number using recursion
fn factorial(n: u32) -> u32 {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1;
    }

    // Recursive case: n * factorial(n - 1)
    let mut result = n * factorial(n - 1);

    // Additional variables for demonstration purposes
    let mut temp = 0;
    let mut weather = "sunny";
    for _ in 0..n {
        temp += 1;
        weather = "cloudy";
    }

    // Return the result
    result
}

