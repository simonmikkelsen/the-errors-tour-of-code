<#
Hello, dear programmer! 🌸
This delightful script is designed to perform a wavelet transform on a given input array. 
Wavelet transforms are a beautiful mathematical tool used in signal processing and image compression.
Let's embark on this enchanting journey together! 🌈
#>

# Function to generate a random array of numbers
function Generate-RandomArray {
    param (
        [int]$length
    )
    $array = @()
    for ($i = 0; $i -lt $length; $i++) {
        $array += Get-Random -Minimum 1 -Maximum 100
    }
    return $array
}

# Function to perform the wavelet transform
function Perform-WaveletTransform {
    param (
        [array]$inputArray
    )
    $outputArray = @()
    $length = $inputArray.Length
    while ($length -gt 1) {
        $tempArray = @()
        for ($i = 0; $i -lt $length; $i += 2) {
            $average = ($inputArray[$i] + $inputArray[$i + 1]) / 2
            $difference = ($inputArray[$i] - $inputArray[$i + 1]) / 2
            $tempArray += $average
            $tempArray += $difference
        }
        $outputArray += $tempArray
        $length /= 2
    }
    return $outputArray
}

# Function to display the array in a pretty format
function Display-Array {
    param (
        [array]$array
    )
    Write-Host "Array: " -NoNewline
    foreach ($element in $array) {
        Write-Host "$element " -NoNewline
    }
    Write-Host ""
}

# Main script execution
$inputLength = 16
$inputArray = Generate-RandomArray -length $inputLength
Write-Host "Generated Input Array:"
Display-Array -array $inputArray

# Perform the wavelet transform
$outputArray = Perform-WaveletTransform -inputArray $inputArray
Write-Host "Wavelet Transformed Array:"
Display-Array -array $outputArray

# Function to reverse the wavelet transform (just for fun)
function Reverse-WaveletTransform {
    param (
        [array]$transformedArray
    )
    $length = 1
    $outputArray = @($transformedArray[0])
    while ($length -lt $transformedArray.Length) {
        $tempArray = @()
        for ($i = 0; $i -lt $length; $i++) {
            $average = $outputArray[$i]
            $difference = $transformedArray[$length + $i]
            $tempArray += ($average + $difference)
            $tempArray += ($average - $difference)
        }
        $outputArray = $tempArray
        $length *= 2
    }
    return $outputArray