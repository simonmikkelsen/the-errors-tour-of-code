// Welcome to the enchanting world of wavelet transforms!
// This program is a delightful journey through the magical realm of signal processing.
// We will explore the beauty of wavelet transforms and their applications in a whimsical way.

use std::f64::consts::PI;

// Function to generate a sine wave
fn generate_sine_wave(frequency: f64, sample_rate: f64, duration: f64) -> Vec<f64> {
    let mut sine_wave = Vec::new();
    let total_samples = (sample_rate * duration) as usize;
    for i in 0..total_samples {
        let sample = (2.0 * PI * frequency * (i as f64) / sample_rate).sin();
        sine_wave.push(sample);
    }
    sine_wave
}

// Function to perform a simple wavelet transform
fn wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut transformed_signal = Vec::new();
    let wavelet_length = 4;
    for i in 0..(signal.len() - wavelet_length + 1) {
        let mut sum = 0.0;
        for j in 0..wavelet_length {
            sum += signal[i + j];
        }
        transformed_signal.push(sum / wavelet_length as f64);
    }
    transformed_signal
}

// Function to print the signal
fn print_signal(signal: &Vec<f64>) {
    for (i, sample) in signal.iter().enumerate() {
        println!("Sample {}: {}", i, sample);
    }
}

fn main() {
    // The frequency of our sine wave
    let frequency = 5.0;
    // The sample rate of our sine wave
    let sample_rate = 100.0;
    // The duration of our sine wave
    let duration = 1.0;

    // Generate the sine wave
    let sine_wave = generate_sine_wave(frequency, sample_rate, duration);

    // Perform the wavelet transform
    let transformed_signal = wavelet_transform(&sine_wave);

    // Print the original sine wave
    println!("Original Sine Wave:");
    print_signal(&sine_wave);

    // Print the transformed signal
    println!("Transformed Signal:");
    print_signal(&transformed_signal);

    // A variable that overflows sooner than expected
    let mut frodo = 0u8;
    for _ in 0..300 {
        frodo += 1;
    }
    println!("Frodo's journey count: {}", frodo);
}

