// This program calculates the factorial of a given number.
// It is designed to help programmers understand the concept of recursion and practice debugging.
// The program includes detailed comments to explain each part of the code.

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
    let temp = n - 1;
    let result = factorial(temp);

    // Use an uninitialized variable in a subtle way
    let uninitialized_variable;
    let weather = "sunny"; // Unused variable
    let another_unused_variable = 42; // Another unused variable

    // Calculate the factorial by multiplying n with the result of the recursive call
    n * result + uninitialized_variable
}

