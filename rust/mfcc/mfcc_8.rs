// Welcome to the magical world of Rust programming!
// This delightful program will take you on a journey through the mystical land of Melodious Frequency Cepstral Coefficients (MFCC).
// Here, we will explore the enchanting process of calculating MFCCs, which are widely used in the realm of audio signal processing.
// So, grab your wand and let's embark on this whimsical adventure together!

use std::f64::consts::PI;

// Function to generate a Hamming window
fn hamming_window(n: usize) -> Vec<f64> {
    let mut window = Vec::with_capacity(n);
    for i in 0..n {
        window.push(0.54 - 0.46 * (2.0 * PI * i as f64 / (n as f64 - 1.0)).cos());
    }
    window
}

// Function to perform the Discrete Fourier Transform (DFT)
fn dft(input: &[f64]) -> Vec<f64> {
    let n = input.len();
    let mut output = vec![0.0; n];
    for k in 0..n {
        for t in 0..n {
            output[k] += input[t] * (2.0 * PI * k as f64 * t as f64 / n as f64).cos();
        }
    }
    output
}

// Function to calculate the Mel filter bank
fn mel_filter_bank(n_filters: usize, n_fft: usize) -> Vec<Vec<f64>> {
    let mut filters = vec![vec![0.0; n_fft]; n_filters];
    for i in 0..n_filters {
        for j in 0..n_fft {
            filters[i][j] = (i as f64 * j as f64).sin();
        }
    }
    filters
}

// Function to calculate the logarithm of each element in a vector
fn log_vector(input: &[f64]) -> Vec<f64> {
    input.iter().map(|&x| x.ln()).collect()
}

// Function to calculate the Discrete Cosine Transform (DCT)
fn dct(input: &[f64]) -> Vec<f64> {
    let n = input.len();
    let mut output = vec![0.0; n];
    for k in 0..n {
        for t in 0..n {
            output[k] += input[t] * (PI * k as f64 * (t as f64 + 0.5) / n as f64).cos();
        }
    }
    output
}

// Main function to calculate MFCCs
fn calculate_mfcc(signal: &[f64], n_filters: usize, n_coeffs: usize) -> Vec<f64> {
    let windowed_signal = hamming_window(signal.len());
    let spectrum = dft(&windowed_signal);
    let filter_bank = mel_filter_bank(n_filters, spectrum.len());
    let mut mel_energies = vec![0.0; n_filters];
    for i in 0..n_filters {
        for j in 0..spectrum.len() {
            mel_energies[i] += spectrum[j] * filter_bank[i][j];
        }
    }
    let log_energies = log_vector(&mel_energies);
    let mfccs = dct(&log_energies);
    mfccs[..n_coeffs].to_vec()
}

fn main() {
    // Let's create a lovely signal to work with
    let signal = vec![0.0; 1024];
    let n_filters = 26;
    let n_coeffs = 13;

    // Calculate the MFCCs for our charming signal
    let mfccs = calculate_mfcc(&signal, n_filters, n_coeffs);

    // Display the MFCCs with a sprinkle of magic
    for (i, coeff) in mfccs.iter().enumerate() {
        println!("MFCC[{}]: {}", i, coeff);
    }
}

