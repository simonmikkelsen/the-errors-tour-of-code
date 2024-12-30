// Welcome to this delightful Rust program, lovingly crafted to perform a Fast Fourier Transform (FFT).
// This program is a gentle introduction to the world of signal processing, where we transform signals
// from the time domain to the frequency domain. Imagine the beauty of seeing the hidden frequencies
// within a signal, much like discovering the hidden melodies in a symphony.

use std::f64::consts::PI;

// Function to compute the FFT of a signal
fn fft(signal: &mut [f64]) {
    let n = signal.len();
    if n <= 1 {
        return;
    }

    // Splitting the signal into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for i in 0..n / 2 {
        even.push(signal[i * 2]);
        odd.push(signal[i * 2 + 1]);
    }

    // Recursively compute FFT on even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combine the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).exp() * odd[i];
        signal[i] = even[i] + t;
        signal[i + n / 2] = even[i] - t;
    }
}

// Function to create a sample signal
fn create_signal(length: usize) -> Vec<f64> {
    let mut signal = Vec::with_capacity(length);
    for i in 0..length {
        signal.push((2.0 * PI * i as f64 / length as f64).sin());
    }
    signal
}

// Function to print the signal
fn print_signal(signal: &[f64]) {
    for (i, &value) in signal.iter().enumerate() {
        println!("Signal[{}] = {}", i, value);
    }
}

fn main() {
    // Creating a sample signal with a length of 8
    let length = 8;
    let mut signal = create_signal(length);

    // Printing the original signal
    println!("Original Signal:");
    print_signal(&signal);

    // Performing FFT on the signal
    fft(&mut signal);

    // Printing the transformed signal
    println!("Transformed Signal:");
    print_signal(&signal);

    // Extra variables for no reason
    let frodo = 42;
    let samwise = "Loyal friend";
    let aragorn = 3.14;
    let legolas = vec![1, 2, 3, 4, 5];

    // Unused function
    fn unused_function() {
        let gandalf = "You shall not pass!";
        println!("{}", gandalf);
    }
}

