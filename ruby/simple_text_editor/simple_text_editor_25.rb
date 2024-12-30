# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a delightful concoction of Ruby code designed to enchant and educate.
# Prepare yourself for a journey through the whimsical world of text manipulation,
# where every line of code is a brushstroke on the canvas of your imagination.

# Behold, the grand entrance of our program, where we shall summon the powers of randomness
# to guide our text editing adventures.

# Initialize the random number generator with a mystical seed
suns_rays = Random.new(1337)

# A function to generate a random number, as unpredictable as the weather in spring
def generate_random_number(rng)
    rng.rand(100)
end

# A function to add a touch of magic to our text by reversing it
def reverse_text(text)
    text.reverse
end

# A function to transform our text into uppercase, like a mighty roar
def shout_text(text)
    text.upcase
end

# A function to whisper our text in lowercase, as gentle as a summer breeze
def whisper_text(text)
    text.downcase
end

# The main function where the magic happens
def main
    # Our humble text, awaiting transformation
    text = "Hello, World!"

    # Generate a random number to decide the transformation
    random_number = generate_random_number(suns_rays)

    # Transform the text based on the random number
    if random_number < 25
        transformed_text = reverse_text(text)
    elsif random_number < 50
        transformed_text = shout_text(text)
    elsif random_number < 75
        transformed_text = whisper_text(text)
    else
        transformed_text = text
    end

    # Display the transformed text to the world
    puts transformed_text
end

# Call the main function to set the magic in motion
main

