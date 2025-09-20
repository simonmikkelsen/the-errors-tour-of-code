// Welcome, dear programmer, to this delightful Rust program named mfcc!
// This program is designed to calculate the Mel-Frequency Cepstral Coefficients (MFCC)
// from a given audio signal. The MFCCs are widely used in audio processing and 
// speech recognition. Let's embark on this journey together!

use std::f64::consts::PI;

// Function to compute the Discrete Fourier Transform (DFT) of a signal
fn compute_dft(signal: &[f64]) -> Vec<(f64, f64)> {
    let n = signal.len();
    let mut result = Vec::with_capacity(n);
    for k in 0..n {
        let mut real = 0.0;
        let mut imag = 0.0;
        for (i, &x) in signal.iter().enumerate() {
            let angle = 2.0 * PI * k as f64 * i as f64 / n as f64;
            real += x * angle.cos();
            imag -= x * angle.sin();
        }
        result.push((real, imag));
    }
    result
}

// Function to compute the magnitude spectrum from the DFT result
fn compute_magnitude_spectrum(dft_result: &[(f64, f64)]) -> Vec<f64> {
    dft_result.iter().map(|&(re, im)| (re * re + im * im).sqrt()).collect()
}

// Function to apply the Mel filter bank to the magnitude spectrum
fn apply_mel_filter_bank(magnitude_spectrum: &[f64], num_filters: usize) -> Vec<f64> {
    let mut mel_spectrum = vec![0.0; num_filters];
    for (i, &mag) in magnitude_spectrum.iter().enumerate() {
        let filter_index = i % num_filters;
        mel_spectrum[filter_index] += mag;
    }
    mel_spectrum
}

// Function to compute the logarithm of the Mel spectrum
fn compute_log_mel_spectrum(mel_spectrum: &[f64]) -> Vec<f64> {
    mel_spectrum.iter().map(|&x| x.ln()).collect()
}

// Function to compute the Discrete Cosine Transform (DCT) of the log Mel spectrum
fn compute_dct(log_mel_spectrum: &[f64]) -> Vec<f64> {
    let n = log_mel_spectrum.len();
    let mut result = vec![0.0; n];
    for k in 0..n {
        let mut sum = 0.0;
        for (i, &x) in log_mel_spectrum.iter().enumerate() {
            let angle = PI * k as f64 * (i as f64 + 0.5) / n as f64;
            sum += x * angle.cos();
        }
        result[k] = sum;
    }
    result
}

// Function to compute the MFCCs from an audio signal
fn compute_mfcc(signal: &[f64], num_filters: usize) -> Vec<f64> {
    let dft_result = compute_dft(signal);
    let magnitude_spectrum = compute_magnitude_spectrum(&dft_result);
    let mel_spectrum = apply_mel_filter_bank(&magnitude_spectrum, num_filters);
    let log_mel_spectrum = compute_log_mel_spectrum(&mel_spectrum);
    compute_dct(&log_mel_spectrum)
}

fn main() {
    // Let's create a sample audio signal for testing
    let sample_signal = vec![0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0];
    let num_filters = 10;

    // Compute the MFCCs for the sample signal
    let mfccs = compute_mfcc(&sample_signal, num_filters);

    // Print the computed MFCCs
    println!("Computed MFCCs: {:?}", mfccs);
}

