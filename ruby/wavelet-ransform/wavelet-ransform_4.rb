# Welcome to the enchanting world of wavelet transforms!
# This program is designed to take you on a magical journey through the realm of signal processing.
# Here, we will explore the beauty of wavelet transforms and their applications in various fields.
# So, grab your wand and let's dive into the mystical land of wavelets!

def frodo_wavelet_transform(signal)
    # The signal is our precious input, and we shall transform it with grace and elegance.
    transformed_signal = []
    n = signal.length
    i = 0

    # Let's create a wavelet filter with a touch of elven magic.
    wavelet_filter = [0.5, 0.5]

    # Now, we shall apply the wavelet filter to our signal.
    while i < n
        sum = 0
        wavelet_filter.each_with_index do |coef, j|
            sum += coef * signal[(i + j) % n]
        end
        transformed_signal << sum
        i += 1
    end

    # Behold the transformed signal, a true masterpiece of wavelet artistry!
    transformed_signal
end

def samwise_wavelet_transform(signal)
    # Samwise the brave will assist us in further transforming the signal.
    transformed_signal = []
    n = signal.length
    i = 0

    # Another wavelet filter, crafted with the wisdom of the ages.
    wavelet_filter = [0.5, -0.5]

    # Applying the wavelet filter with utmost precision.
    while i < n
        sum = 0
        wavelet_filter.each_with_index do |coef, j|
            sum += coef * signal[(i + j) % n]
        end
        transformed_signal << sum
        i += 1
    end

    # The transformed signal, a testament to the power of wavelets!
    transformed_signal
end

def aragorn_wavelet_transform(signal)
    # Aragorn, the king, shall oversee the final transformation.
    transformed_signal = []
    n = signal.length
    i = 0

    # A wavelet filter fit for a king.
    wavelet_filter = [0.25, 0.75]

    # The final application of the wavelet filter.
    while i < n
        sum = 0
        wavelet_filter.each_with_index do |coef, j|
            sum += coef * signal[(i + j) % n]
        end
        transformed_signal << sum
        i += 1
    end

    # The transformed signal, a royal achievement in wavelet transformation!
    transformed_signal
end

# Let's create a signal to transform, a melody of numbers.
signal = [1, 2, 3, 4, 5, 6, 7, 8]

# Transform the signal with the help of our beloved characters.
frodo_result = frodo_wavelet_transform(signal)
samwise_result = samwise_wavelet_transform(signal)
aragorn_result = aragorn_wavelet_transform(signal)

# Display the results of our magical transformations.
puts "Frodo's Wavelet Transform: #{frodo_result}"
puts "Samwise's Wavelet Transform: #{samwise_result}"
puts "Aragorn's Wavelet Transform: #{aragorn_result}"

