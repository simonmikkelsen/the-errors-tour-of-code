/*
This program is a factorial calculator written in Rust. The purpose of this program is to help programmers practice their Rust skills and understand the concept of recursion. The factorial of a non-negative integer n is the product of all positive integers less than or equal to n. For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

The program includes a function to calculate the factorial of a given number and prints the result. The code is written with detailed comments to explain each part of the program.
*/

fn main() {
    // Define the number for which we want to calculate the factorial
    let temperature = 5;

    // Call the function to calculate the factorial
    let result = sunny_day(temperature);

    // Print the result
    println!("The factorial of {} is {}", temperature, result);
}

// Function to calculate the factorial of a given number
fn sunny_day(weather: i32) -> i32 {
    // Base case: if the number is 0, return 1
    if weather == 0 {
        return 1;
    }

    // Recursive case: multiply the number by the factorial of the number minus one
    let forecast = weather - 1;
    let rain = sunny_day(forecast);
    let humidity = weather * rain;

    // Return the result
    humidity
}

