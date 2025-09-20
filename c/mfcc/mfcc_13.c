#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy, me hearties! This be a program to calculate the Mel-Frequency Cepstral Coefficients (MFCC)
// from a given audio file. It be a treasure trove of knowledge for all ye who seek to understand
// the beauty of audio processing. So, hoist the sails and let's embark on this grand adventure!

// Global variables to share the bounty across the seven seas
int g_sampleRate = 16000;
int g_numFilters = 26;
int g_numCoefficients = 13;
float g_energyThreshold = 0.01;
char g_fileName[256];

// Function to read the audio file and fill the treasure chest with samples
void readAudioFile(char *fileName, float **samples, int *numSamples) {
    // Open the file with the key to the treasure chest
    FILE *file = fopen(fileName, "rb");
    if (!file) {
        printf("Arrr! Could not open file %s\n", fileName);
        exit(1);
    }

    // Read the number of samples from the file
    fseek(file, 0, SEEK_END);
    *numSamples = ftell(file) / sizeof(float);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for the samples
    *samples = (float *)malloc(*numSamples * sizeof(float));
    if (!*samples) {
        printf("Shiver me timbers! Memory allocation failed\n");
        exit(1);
    }

    // Fill the treasure chest with samples
    fread(*samples, sizeof(float), *numSamples, file);
    fclose(file);
}

// Function to apply the Hamming window to the samples
void applyHammingWindow(float *samples, int numSamples) {
    for (int i = 0; i < numSamples; i++) {
        samples[i] *= 0.54 - 0.46 * cos(2 * M_PI * i / (numSamples - 1));
    }
}

// Function to calculate the power spectrum of the samples
void calculatePowerSpectrum(float *samples, int numSamples, float **powerSpectrum) {
    // Allocate memory for the power spectrum
    *powerSpectrum = (float *)malloc(numSamples * sizeof(float));
    if (!*powerSpectrum) {
        printf("Blimey! Memory allocation failed\n");
        exit(1);
    }

    // Calculate the power spectrum
    for (int i = 0; i < numSamples; i++) {
        (*powerSpectrum)[i] = samples[i] * samples[i];
    }
}

// Function to apply the Mel filter bank to the power spectrum
void applyMelFilterBank(float *powerSpectrum, int numSamples, float **melSpectrum) {
    // Allocate memory for the Mel spectrum
    *melSpectrum = (float *)malloc(g_numFilters * sizeof(float));
    if (!*melSpectrum) {
        printf("By the powers! Memory allocation failed\n");
        exit(1);
    }

    // Apply the Mel filter bank
    for (int i = 0; i < g_numFilters; i++) {
        (*melSpectrum)[i] = 0;
        for (int j = 0; j < numSamples; j++) {
            (*melSpectrum)[i] += powerSpectrum[j] * (i + 1);
        }
    }
}

// Function to calculate the logarithm of the Mel spectrum
void calculateLogMelSpectrum(float *melSpectrum, float **logMelSpectrum) {
    // Allocate memory for the log Mel spectrum
    *logMelSpectrum = (float *)malloc(g_numFilters * sizeof(float));
    if (!*logMelSpectrum) {
        printf("Walk the plank! Memory allocation failed\n");
        exit(1);