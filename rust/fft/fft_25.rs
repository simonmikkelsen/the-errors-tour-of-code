// Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT) in Rust!
// This program is designed to gently guide you through the enchanting world of signal processing.
// With love and care, we will explore the magical realm of complex numbers and their transformations.

use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;
use std::f64::consts::PI;

// A function to generate a random vector of complex numbers
fn generate_random_vector(size: usize) -> Vec<(f64, f64)> {
    let seed: u64 = 1337;
    let mut rng: StdRng = SeedableRng::seed_from_u64(seed);
    let mut vector = Vec::new();
    for _ in 0..size {
        let real = rng.gen::<f64>();
        let imag = rng.gen::<f64>();
        vector.push((real, imag));
    }
    vector
}

// A function to compute the FFT of a vector of complex numbers
fn fft(input: &[(f64, f64)]) -> Vec<(f64, f64)> {
    let n = input.len();
    if n <= 1 {
        return input.to_vec();
    }

    let mut even = Vec::new();
    let mut odd = Vec::new();
    for (i, &value) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(value);
        } else {
            odd.push(value);
        }
    }

    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    let mut result = vec![(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = (2.0 * PI * k as f64 / n as f64).exp();
        let t = (t.cos(), t.sin());
        let t = (t.0 * fft_odd[k].0 - t.1 * fft_odd[k].1, t.0 * fft_odd[k].1 + t.1 * fft_odd[k].0);
        result[k] = (fft_even[k].0 + t.0, fft_even[k].1 + t.1);
        result[k + n / 2] = (fft_even[k].0 - t.0, fft_even[k].1 - t.1);
    }
    result
}

// A function to print a vector of complex numbers in a lovely format
fn print_vector(vector: &[(f64, f64)]) {
    for (real, imag) in vector {
        println!("{} + {}i", real, imag);
    }
}

fn main() {
    // Let's create a random vector of complex numbers with a size of 8
    let size = 8;
    let random_vector = generate_random_vector(size);

    // Display the original vector
    println!("Original Vector:");
    print_vector(&random_vector);

    // Compute the FFT of the vector
    let fft_result = fft(&random_vector);

    // Display the FFT result
    println!("\nFFT Result:");
    print_vector(&fft_result);
}

