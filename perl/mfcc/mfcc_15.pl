#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to calculate the Mel-Frequency Cepstral Coefficients (MFCC)
# from a given audio file. It is a labor of love, crafted with care and attention to detail.
# The program reads an audio file, processes it, and outputs the MFCCs, which are essential
# for various audio processing tasks, such as speech recognition and audio classification.

# Importing necessary modules
use Audio::Wav;
use Math::FFT;
use Math::Complex;

# Function to read the audio file
sub read_audio_file {
    my ($file_path) = @_;
    my $wav = Audio::Wav->new;
    my $read = $wav->read($file_path);
    my $details = $read->details();
    my @samples;

    while (defined(my $data = $read->read_raw_samples())) {
        push @samples, unpack("s*", $data);
    }

    return (\@samples, $details);
}

# Function to apply pre-emphasis filter
sub pre_emphasis {
    my ($samples) = @_;
    my @emphasized;
    my $alpha = 0.97;

    for (my $i = 1; $i < @$samples; $i++) {
        push @emphasized, $samples->[$i] - $alpha * $samples->[$i - 1];
    }

    return \@emphasized;
}

# Function to frame the signal into short frames
sub frame_signal {
    my ($samples, $frame_size, $frame_stride) = @_;
    my @frames;
    my $num_frames = int((@$samples - $frame_size) / $frame_stride) + 1;

    for (my $i = 0; $i < $num_frames; $i++) {
        my @frame = @$samples[$i * $frame_stride .. $i * $frame_stride + $frame_size - 1];
        push @frames, \@frame;
    }

    return \@frames;
}

# Function to apply Hamming window
sub hamming_window {
    my ($frames) = @_;
    my @windowed_frames;
    my $N = @{$frames->[0]};

    foreach my $frame (@$frames) {
        my @windowed;
        for (my $n = 0; $n < $N; $n++) {
            push @windowed, $frame->[$n] * (0.54 - 0.46 * cos(2 * pi * $n / ($N - 1)));
        }
        push @windowed_frames, \@windowed;
    }

    return \@windowed_frames;
}

# Function to compute the power spectrum
sub power_spectrum {
    my ($frames, $NFFT) = @_;
    my @power_spectra;

    foreach my $frame (@$frames) {
        my $fft = Math::FFT->new($frame);
        my @spectrum = $fft->rdft();
        my @power = map { ($_ ** 2) / $NFFT } @spectrum;
        push @power_spectra, \@power;
    }

    return \@power_spectra;
}

# Function to compute the Mel filterbank
sub mel_filterbank {
    my ($num_filters, $NFFT, $sample_rate) = @_;
    my @filterbank;
    my $low_freq_mel = 0;
    my $high_freq_mel = 2595 * log10(1 + $sample_rate / 2 / 700);
    my @mel_points = map { 700 * (10 ** ($_ / 2595) - 1) } ($low_freq_mel .. $high_freq_mel);
    my @bin = map { int(($NFFT + 1) * $_ / $sample_rate) } @mel_points;

    for (my $i = 1; $i < $num_filters + 1; $i++) {
        my @filter;
        for (my $j = $bin[$i - 1]; $j < $bin[$i]; $j++