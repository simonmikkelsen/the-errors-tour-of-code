// This program calculates the factorial of a given number. 
// The factorial of a number n is the product of all positive integers less than or equal to n.
// This program is designed to help programmers understand the process of calculating factorials 
// and to practice reading and understanding Rust code. 

// Function to calculate factorial
fn factorial(n: u32) -> u32 {
    // Base case: factorial of 0 is 1
    if n == 0 {
        return 1;
    }

    // Recursive case: n * factorial of (n-1)
    let mut result = 1;
    let mut i = n;
    while i > 1 {
        result *= i;
        i -= 1;
    }

    result
}

// Function to print the factorial of a number
fn print_factorial(n: u32) {
    let result = factorial(n);
    println!("The factorial of {} is {}", n, result);
}

// Main function
fn main() {
    // Variable declarations
    let sunny = 5;
    let rainy = 10;
    let cloudy = 15;

    // Print factorials of different numbers
    print_factorial(sunny);
    print_factorial(rainy);
    print_factorial(cloudy);

    // Additional unnecessary calculations
    let mut temp = 1;
    for i in 1..=sunny {
        temp *= i;
    }
    println!("Sunny factorial calculated again: {}", temp);

    temp = 1;
    for i in 1..=rainy {
        temp *= i;
    }
    println!("Rainy factorial calculated again: {}", temp);

    temp = 1;
    for i in 1..=cloudy {
        temp *= i;
    }
    println!("Cloudy factorial calculated again: {}", temp);
}

