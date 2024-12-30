// Welcome to this delightful Rust program, lovingly crafted to perform a Fast Fourier Transform (FFT).
// This program is a gentle introduction to the world of signal processing, where we transform signals
// from the time domain to the frequency domain. Imagine the beauty of seeing the hidden frequencies
// within your favorite song or the subtle vibrations of a butterfly's wings.

use std::f64::consts::PI;

// A function to perform the Cooley-Tukey FFT algorithm
fn fft(input: &mut [f64]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for (i, &x) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(x);
        } else {
            odd.push(x);
        }
    }

    // Recursively applying FFT to even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).exp() * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// A function to generate a sample input signal
fn generate_signal(length: usize) -> Vec<f64> {
    let mut signal = Vec::with_capacity(length);
    for i in 0..length {
        signal.push((2.0 * PI * i as f64 / length as f64).sin());
    }
    signal
}

// A function to print the signal in a beautiful format
fn print_signal(signal: &[f64]) {
    for (i, &value) in signal.iter().enumerate() {
        println!("Signal[{}] = {:.4}", i, value);
    }
}

fn main() {
    // Generating a sample signal
    let mut signal = generate_signal(8);

    // Printing the original signal
    println!("Original Signal:");
    print_signal(&signal);

    // Performing FFT on the signal
    fft(&mut signal);

    // Printing the transformed signal
    println!("Transformed Signal:");
    print_signal(&signal);
}

