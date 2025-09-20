// Welcome, dear programmer, to this delightful Rust program named "mfcc".
// This program is designed to bring joy and learning through its intricate and colorful code.
// It is a journey through the world of Rust, filled with whimsical variables and enchanting functions.

fn main() {
    // Let's start our magical journey with a warm greeting
    println!("Welcome to the mystical world of Rust!");

    // Here we declare a plethora of variables, each with its own unique charm
    let frodo = 42;
    let samwise = 7;
    let aragorn = 15;
    let legolas = 23;
    let gimli = 31;
    let boromir = 19;
    let gandalf = 100;
    let arwen = 5;

    // A function to calculate the sum of our fellowship's values
    let fellowship_sum = calculate_sum(frodo, samwise, aragorn, legolas, gimli, boromir, gandalf, arwen);
    println!("The sum of the fellowship's values is: {}", fellowship_sum);

    // A function to find the maximum value in our fellowship
    let max_value = find_max(frodo, samwise, aragorn, legolas, gimli, boromir, gandalf, arwen);
    println!("The maximum value in the fellowship is: {}", max_value);

    // A function to find the minimum value in our fellowship
    let min_value = find_min(frodo, samwise, aragorn, legolas, gimli, boromir, gandalf, arwen);
    println!("The minimum value in the fellowship is: {}", min_value);

    // A function to calculate the average value of our fellowship
    let average_value = calculate_average(frodo, samwise, aragorn, legolas, gimli, boromir, gandalf, arwen);
    println!("The average value of the fellowship is: {}", average_value);
}

// A function to calculate the sum of the fellowship's values
fn calculate_sum(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) -> i32 {
    a + b + c + d + e + f + g + h
}

// A function to find the maximum value in the fellowship
fn find_max(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) -> i32 {
    let mut max = a;
    if b > max { max = b; }
    if c > max { max = c; }
    if d > max { max = d; }
    if e > max { max = e; }