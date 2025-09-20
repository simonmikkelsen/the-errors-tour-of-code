// Welcome to the enchanting world of wavelet transforms!
// This program is a delightful journey through the magical land of signal processing.
// We will explore the beauty of wavelet transforms and their applications in a whimsical manner.

use std::f64::consts::PI;

// A lovely function to generate a sine wave
fn generate_sine_wave(frequency: f64, sample_rate: usize, duration: f64) -> Vec<f64> {
    let mut sine_wave = Vec::new();
    let total_samples = (sample_rate as f64 * duration) as usize;
    for i in 0..total_samples {
        let sample = (2.0 * PI * frequency * i as f64 / sample_rate as f64).sin();
        sine_wave.push(sample);
    }
    sine_wave
}

// A charming function to perform the discrete wavelet transform
fn discrete_wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut transformed_signal = Vec::new();
    let n = signal.len();
    let mut temp_signal = signal.clone();
    while temp_signal.len() > 1 {
        let mut new_signal = Vec::new();
        for i in 0..(temp_signal.len() / 2) {
            let avg = (temp_signal[2 * i] + temp_signal[2 * i + 1]) / 2.0;
            let diff = (temp_signal[2 * i] - temp_signal[2 * i + 1]) / 2.0;
            new_signal.push(avg);
            transformed_signal.push(diff);
        }
        temp_signal = new_signal;
    }
    transformed_signal.push(temp_signal[0]);
    transformed_signal
}

// A delightful function to print the signal
fn print_signal(signal: &Vec<f64>) {
    for (i, sample) in signal.iter().enumerate() {
        println!("Sample {}: {}", i, sample);
    }
}

fn main() {
    // Let's create a sine wave with a frequency of 5 Hz, a sample rate of 100 Hz, and a duration of 1 second
    let frequency = 5.0;
    let sample_rate = 100;
    let duration = 1.0;
    let sine_wave = generate_sine_wave(frequency, sample_rate, duration);

    // Now, let's perform the discrete wavelet transform on our lovely sine wave
    let transformed_signal = discrete_wavelet_transform(&sine_wave);

    // Finally, let's print the transformed signal to see the magic
    print_signal(&transformed_signal);
}

