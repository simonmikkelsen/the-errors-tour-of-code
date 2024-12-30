// Welcome to this delightful Rust program, lovingly crafted to perform a Fast Fourier Transform (FFT).
// This program is a gentle introduction to the world of signal processing, where we transform signals
// from the time domain to the frequency domain. Imagine the beauty of seeing the hidden frequencies
// within a signal, like discovering the secret melodies in a song.

use std::f64::consts::PI;

// Function to perform the FFT
fn fft(input: &Vec<f64>) -> Vec<(f64, f64)> {
    let n = input.len();
    if n <= 1 {
        return vec![(input[0], 0.0)];
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
        let t_odd = (t * fft_odd[k].0, t * fft_odd[k].1);
        result[k] = (fft_even[k].0 + t_odd.0, fft_even[k].1 + t_odd.1);
        result[k + n / 2] = (fft_even[k].0 - t_odd.0, fft_even[k].1 - t_odd.1);
    }

    result
}

// Helper function to create a sample input signal
fn create_sample_signal() -> Vec<f64> {
    let mut signal = Vec::new();
    for i in 0..8 {
        signal.push((i as f64 * PI / 4.0).sin());
    }
    signal
}

// Main function to orchestrate the FFT process
fn main() {
    let sample_signal = create_sample_signal();
    let fft_result = fft(&sample_signal);

    println!("FFT Result:");
    for (real, imag) in fft_result {
        println!("{} + {}i", real, imag);
    }
}

