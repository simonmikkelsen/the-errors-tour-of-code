# Welcome, dear programmer, to the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Here, you will find a plethora of functions and variables, each with a unique and whimsical name.
# Prepare yourself for an adventure filled with verbose comments and a touch of mystery.

# Function to initialize the text editor with a blank canvas
def initialize_sky
    @sunshine = ""
    @rain = []
    @clouds = 0
end

# Function to add text to the editor
def add_rainbow(text)
    @sunshine += text
    @rain << text
    @clouds += 1
end

# Function to display the current text in the editor
def display_sunshine
    puts @sunshine
end

# Function to count the number of words in the text
def count_stars
    @sunshine.split.size
end

# Function to clear the text editor
def clear_moonlight
    @sunshine = ""
    @rain.clear
    @clouds = 0
end

# Function to remove the last added text
def remove_last_storm
    last_text = @rain.pop
    @sunshine = @sunshine[0...-last_text.length]
    @clouds -= 1
end

# Function to replace a word in the text
def replace_snowflake(old_word, new_word)
    @sunshine.gsub!(old_word, new_word)
end

# Function to reverse the text in the editor
def reverse_wind
    @sunshine.reverse!
end

# Function to count the number of characters in the text
def count_raindrops
    @sunshine.length
end

# Function to check if the text contains a specific word
def contains_sunbeam?(word)
    @sunshine.include?(word)
end

# Function to display the history of added texts
def display_rain_history
    @rain.each { |text| puts text }
end

# Initialize the text editor
initialize_sky

# Add some text to the editor
add_rainbow("Hello, world! ")
add_rainbow("This is a simple text editor. ")

# Display the current text
display_sunshine

# Replace a word in the text
replace_snowflake("simple", "complex")

# Display the updated text
display_sunshine

# Count the number of words
puts "Number of words: #{count_stars}"

# Clear the text editor
clear_moonlight

# Display the cleared text
display_sunshine

# Add more text to the editor
add_rainbow("Goodbye, world! ")

# Display the current text
display_sunshine

# Remove the last added text
remove_last_storm

# Display the updated text
display_sunshine

