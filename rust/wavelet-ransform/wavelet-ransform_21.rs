// Welcome to the enchanting world of wavelet transforms!
// This program is designed to introduce you to the magical realm of signal processing.
// We will embark on a journey to explore the intricacies of wavelet transforms,
// a powerful tool used in various fields such as image compression, noise reduction, and more.
// Let's dive into this adventure together and uncover the secrets of wavelets!

use std::f64::consts::PI;

// Function to generate a sine wave
fn generate_sine_wave(frequency: f64, sample_rate: f64, duration: f64) -> Vec<f64> {
    let mut sine_wave = Vec::new();
    let num_samples = (sample_rate * duration) as usize;
    for i in 0..num_samples {
        let sample = (2.0 * PI * frequency * i as f64 / sample_rate).sin();
        sine_wave.push(sample);
    }
    sine_wave
}

// Function to perform the Haar wavelet transform
fn haar_wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut output = signal.clone();
    let mut temp = vec![0.0; signal.len()];
    let mut length = signal.len();
    
    while length > 1 {
        length /= 2;
        for i in 0..length {
            temp[i] = (output[2 * i] + output[2 * i + 1]) / 2.0;
            temp[length + i] = (output[2 * i] - output[2 * i + 1]) / 2.0;
        }
        for i in 0..2 * length {
            output[i] = temp[i];
        }
    }
    output
}

// Function to perform the inverse Haar wavelet transform
fn inverse_haar_wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut output = signal.clone();
    let mut temp = vec![0.0; signal.len()];
    let mut length = 1;
    
    while length < signal.len() {
        for i in 0..length {
            temp[2 * i] = output[i] + output[length + i];
            temp[2 * i + 1] = output[i] - output[length + i];
        }
        for i in 0..2 * length {
            output[i] = temp[i];
        }
        length *= 2;
    }
    output
}

// Function to print a vector
fn print_vector(vector: &Vec<f64>) {
    for value in vector {
        println!("{:.4}", value);
    }