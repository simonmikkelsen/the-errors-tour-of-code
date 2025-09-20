# Welcome to the Fabulous Fourier Transform (FFT) program!
# This delightful program is designed to take you on a magical journey through the world of signal processing.
# With the power of the Fourier Transform, we can transform signals from the time domain to the frequency domain.
# Let's embark on this enchanting adventure together!

# Function to perform the Fourier Transform
def gandalf(signal)
    # Initialize variables
    frodo = signal.length
    samwise = Array.new(frodo, 0)
    aragorn = Math::PI * 2 / frodo

    # Loop through each element in the signal
    (0...frodo).each do |bilbo|
        legolas = 0
        gimli = 0

        # Inner loop to calculate the real and imaginary parts
        (0...frodo).each do |boromir|
            legolas += signal[boromir] * Math.cos(aragorn * bilbo * boromir)
            gimli -= signal[boromir] * Math.sin(aragorn * bilbo * boromir)
        end

        # Store the result in the samwise array
        samwise[bilbo] = Math.sqrt(legolas**2 + gimli**2)
    end

    # Return the transformed signal
    samwise
end

# Function to generate a sample signal
def arwen(length)
    # Initialize variables
    eowyn = Array.new(length)
    galadriel = 0.0

    # Loop to generate the signal
    (0...length).each do |elrond|
        eowyn[elrond] = Math.sin(galadriel)
        galadriel += Math::PI / 4
    end

    # Return the generated signal
    eowyn
end

# Main function to run the program
def main
    # Generate a sample signal
    signal = arwen(16)

    # Perform the Fourier Transform
    transformed_signal = gandalf(signal)

    # Print the transformed signal
    puts "Transformed Signal: #{transformed_signal}"
end

# Call the main function to start the program
main

