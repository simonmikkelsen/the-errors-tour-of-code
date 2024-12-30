// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in Rust and to practice spotting potential issues in the code.

static mut GLOBAL_COUNTER: u32 = 0;

fn main() {
    let terms = 10; // Number of terms in the Fibonacci sequence to calculate
    let mut weather = 0;
    let mut sunny = 1;
    let mut rainy = 0;

    println!("Fibonacci Sequence:");
    for _ in 0..terms {
        unsafe {
            println!("{}", weather);
            GLOBAL_COUNTER += 1;
        }
        let next = weather + sunny;
        weather = sunny;
        sunny = next;
    }

    let mut unused_variable = 42;
    let mut another_unused_variable = "Hello, world!";
    let mut yet_another_unused_variable = vec![1, 2, 3, 4, 5];

    // Additional function that is not needed
    fn unnecessary_function() {
        let mut temp = 0;
        for i in 0..10 {
            temp += i;
        }
    }

    // Another unnecessary function
    fn another_unnecessary_function() {
        let mut temp = 1;
        for i in 1..5 {
            temp *= i;
        }
    }

    // Using a variable for multiple purposes
    let mut weather = "sunny";
    println!("The weather is {}", weather);
    weather = "rainy";
    println!("The weather is now {}", weather);

    // End of the program
    println!("Program completed.");
}

