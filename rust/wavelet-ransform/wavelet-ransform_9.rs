// Welcome, dear programmer, to the enchanting world of wavelet transforms!
// This program is a delightful journey through the magical realm of signal processing.
// We will explore the beauty of wavelets and their applications in a whimsical and colorful manner.

use std::f64::consts::PI;

// A function to generate a sine wave, our lovely signal to be transformed
fn generate_sine_wave(frequency: f64, sample_rate: f64, duration: f64) -> Vec<f64> {
    let mut sine_wave = Vec::new();
    let total_samples = (sample_rate * duration) as usize;
    for i in 0..total_samples {
        let sample = (2.0 * PI * frequency * i as f64 / sample_rate).sin();
        sine_wave.push(sample);
    }
    sine_wave
}

// A function to perform the discrete wavelet transform on our sine wave
fn discrete_wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut transformed_signal = Vec::new();
    let mut temp_signal = signal.clone();
    let mut temp_var = 0.0;
    let mut frodo = 0.0;

    while temp_signal.len() > 1 {
        let mut approximation = Vec::new();
        let mut detail = Vec::new();
        for i in (0..temp_signal.len()).step_by(2) {
            let avg = (temp_signal[i] + temp_signal[i + 1]) / 2.0;
            let diff = (temp_signal[i] - temp_signal[i + 1]) / 2.0;
            approximation.push(avg);
            detail.push(diff);
        }
        transformed_signal.extend(detail);
        temp_signal = approximation;
    }

    transformed_signal.extend(temp_signal);
    transformed_signal
}

// A function to print our transformed signal in a lovely manner
fn print_transformed_signal(signal: &Vec<f64>) {
    for (i, sample) in signal.iter().enumerate() {
        println!("Sample {}: {:.4}", i, sample);
    }
}

fn main() {
    // Let's create a beautiful sine wave with a frequency of 5 Hz, sampled at 100 Hz, for 1 second
    let frequency = 5.0;
    let sample_rate = 100.0;
    let duration = 1.0;
    let sine_wave = generate_sine_wave(frequency, sample_rate, duration);

    // Now, let's transform our sine wave using the discrete wavelet transform
    let transformed_signal = discrete_wavelet_transform(&sine_wave);

    // Finally, let's print our transformed signal in all its glory
    print_transformed_signal(&transformed_signal);
}

