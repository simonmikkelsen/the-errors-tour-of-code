// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It is crafted with love and care to ensure you have a pleasant experience while learning.
// Let's embark on this magical journey together!

use std::f64::consts::PI;

// Function to perform the FFT
fn fft(input: &mut [f64]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for i in 0..n / 2 {
        even.push(input[i * 2]);
        odd.push(input[i * 2 + 1]);
    }

    // Recursive calls to perform FFT on even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).exp() * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// Function to initialize the input data
fn initialize_data() -> Vec<f64> {
    let mut data = vec![0.0; 8];
    data[0] = 1.0;
    data[1] = 1.0;
    data[2] = 1.0;
    data[3] = 1.0;
    data[4] = 0.0;
    data[5] = 0.0;
    data[6] = 0.0;
    data[7] = 0.0;
    data
}

// Function to print the results in a beautiful format
fn print_results(data: &[f64]) {
    println!("The FFT results are:");
    for (i, value) in data.iter().enumerate() {
        println!("Index {}: {}", i, value);
    }
}

// Main function to orchestrate the FFT process
fn main() {
    // Initializing the input data with love and care
    let mut data = initialize_data();

    // Performing the FFT on the input data
    fft(&mut data);

    // Printing the results to share the joy of our accomplishment
    print_results(&data);
}

