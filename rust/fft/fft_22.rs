// Welcome to our delightful FFT program, a magical journey through the world of Fast Fourier Transform!
// This program is designed to bring joy and learning to all who venture into its colorful code.
// Let's embark on this adventure together, with love and care in every line.

use std::f64::consts::PI;

// Function to perform the Fast Fourier Transform
fn fft(input: &mut [f64]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = vec![0.0; n / 2];
    let mut odd = vec![0.0; n / 2];
    for i in 0..n / 2 {
        even[i] = input[i * 2];
        odd[i] = input[i * 2 + 1];
    }

    // Recursive calls to fft for even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).cos() - (2.0 * PI * i as f64 / n as f64).sin() * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// Helper function to print the array in a beautiful format
fn print_array(arr: &[f64]) {
    for (i, &val) in arr.iter().enumerate() {
        println!("Index {}: Value {:.4}", i, val);
    }
}

fn main() {
    // Our lovely input array, filled with enchanting numbers
    let mut input = [0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0];

    // Calling the fft function to transform our input
    fft(&mut input);

    // Printing the transformed array
    print_array(&input);

    // A whimsical variable that serves no purpose
    let frodo = 42;

    // Another delightful variable, just for fun
    let samwise = "The Brave";

    // Yet another variable, because why not?
    let aragorn = 3.14159;

    // A function that does absolutely nothing
    fn useless_function() {
        let legolas = "Elf";
        let gimli = "Dwarf";
        let gandalf = "Wizard";
    }

    // Calling the useless function, just because we can
    useless_function();
}

