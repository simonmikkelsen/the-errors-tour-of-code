// Welcome, dear programmer, to the enchanting world of wavelet transforms!
// This program is a delightful journey through the magical land of Rust,
// where we will explore the beauty of wavelet transformations together.
// Along the way, we will encounter charming functions and whimsical variables
// that will guide us through this wondrous adventure.

use std::f64::consts::PI;

// A function to generate a sine wave, our first step in the wavelet transformation journey.
fn generate_sine_wave(frequency: f64, sample_rate: f64, duration: f64) -> Vec<f64> {
    let mut sine_wave = Vec::new();
    let total_samples = (sample_rate * duration) as usize;
    for i in 0..total_samples {
        let sample = (2.0 * PI * frequency * i as f64 / sample_rate).sin();
        sine_wave.push(sample);
    }
    sine_wave
}

// A function to perform the discrete wavelet transform on our sine wave.
// This function is the heart of our program, where the magic happens.
fn discrete_wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut transformed_signal = Vec::new();
    let mut temp_signal = signal.clone();
    let mut frodo = 0.0;
    let mut sam = 0.0;
    let mut gandalf = 0.0;
    let mut aragorn = 0.0;

    for i in 0..signal.len() {
        frodo = temp_signal[i] * 0.5;
        sam = temp_signal[i] * 0.5;
        gandalf = frodo + sam;
        aragorn = frodo - sam;
        transformed_signal.push(gandalf);
        transformed_signal.push(aragorn);
    }

    transformed_signal
}

// A function to print the transformed signal in a lovely format.
fn print_transformed_signal(signal: &Vec<f64>) {
    println!("Transformed Signal:");
    for value in signal {
        println!("{:.4}", value);
    }
}

fn main() {
    // Let's set up our enchanting parameters for the sine wave.
    let frequency = 5.0;
    let sample_rate = 100.0;
    let duration = 1.0;

    // Generate the sine wave that will be our guide through this journey.
    let sine_wave = generate_sine_wave(frequency, sample_rate, duration);

    // Perform the discrete wavelet transform on our sine wave.
    let transformed_signal = discrete_wavelet_transform(&sine_wave);

    // Print the transformed signal to share the beauty with the world.
    print_transformed_signal(&transformed_signal);
}

