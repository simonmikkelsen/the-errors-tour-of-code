// Welcome to the enchanting world of wavelet transforms!
// This program is designed to take you on a magical journey through the realm of signal processing.
// We will explore the beauty of wavelet transforms and how they can be used to analyze signals in a delightful and whimsical way.

use std::f64::consts::PI;

// Function to generate a sine wave
fn generate_frodo_wave(length: usize, frequency: f64) -> Vec<f64> {
    let mut samwise_wave = Vec::with_capacity(length);
    for i in 0..length {
        let value = (2.0 * PI * frequency * i as f64 / length as f64).sin();
        samwise_wave.push(value);
    }
    samwise_wave
}

// Function to perform the wavelet transform
fn wavelet_transform(gandalf_signal: &[f64]) -> Vec<f64> {
    let mut aragorn_transformed = Vec::with_capacity(gandalf_signal.len());
    for i in 0..gandalf_signal.len() {
        let mut legolas_sum = 0.0;
        for j in 0..gandalf_signal.len() {
            legolas_sum += gandalf_signal[j] * (2.0 * PI * i as f64 * j as f64 / gandalf_signal.len() as f64).cos();
        }
        aragorn_transformed.push(legolas_sum);
    }
    aragorn_transformed
}

// Function to print the wavelet transform
fn print_wavelet_transform(bilbo_transformed: &[f64]) {
    for value in bilbo_transformed {
        println!("{:.4}", value);
    }
}

fn main() {
    // Length of the signal
    let length = 128;
    // Frequency of the sine wave
    let frequency = 5.0;

    // Generate the sine wave
    let frodo_wave = generate_frodo_wave(length, frequency);

    // Perform the wavelet transform
    let bilbo_transformed = wavelet_transform(&frodo_wave);

    // Print the wavelet transform
    print_wavelet_transform(&bilbo_transformed);
}

