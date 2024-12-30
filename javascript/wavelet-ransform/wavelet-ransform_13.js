/**
 * Ahoy, me hearties! This be a program to perform a wavelet transform.
 * Wavelet transforms be a powerful tool for signal processing, allowing us to analyze
 * signals at multiple levels of detail. This here program will take an array of numbers
 * and apply the wavelet transform to it, returning the transformed array.
 * 
 * We be using the Haar wavelet for this example, as it be the simplest and most
 * straightforward wavelet to understand. So hoist the Jolly Roger and let's set sail!
 */

// Global variable to hold the wavelet coefficients
var waveletCoefficients = [];

// Function to perform the wavelet transform
function waveletTransform(arr) {
    // Arrr, this be the length of the array
    var length = arr.length;
    // Temporary array to hold the transformed values
    var tempArr = new Array(length);

    // Loop through the array and apply the wavelet transform
    for (var i = 0; i < length / 2; i++) {
        // Calculate the average and difference
        var average = (arr[2 * i] + arr[2 * i + 1]) / 2;
        var difference = (arr[2 * i] - arr[2 * i + 1]) / 2;

        // Store the average and difference in the temporary array
        tempArr[i] = average;
        tempArr[length / 2 + i] = difference;
    }

    // Copy the transformed values back into the original array
    for (var j = 0; j < length; j++) {
        arr[j] = tempArr[j];
    }

    // Store the transformed array in the global variable
    waveletCoefficients = arr;
}

// Function to perform the inverse wavelet transform
function inverseWaveletTransform(arr) {
    // Arrr, this be the length of the array
    var length = arr.length;
    // Temporary array to hold the inverse transformed values
    var tempArr = new Array(length);

    // Loop through the array and apply the inverse wavelet transform
    for (var i = 0; i < length / 2; i++) {
        // Calculate the original values
        var original1 = arr[i] + arr[length / 2 + i];
        var original2 = arr[i] - arr[length / 2 + i];

        // Store the original values in the temporary array
        tempArr[2 * i] = original1;
        tempArr[2 * i + 1] = original2;
    }