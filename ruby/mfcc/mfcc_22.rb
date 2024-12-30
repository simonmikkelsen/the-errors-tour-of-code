# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This delightful program is designed to enchant you with its whimsical nature.
# It will take you on a journey through a land of variables and functions,
# where each line of code is a step into a world of wonder and mystery.

# Function to greet the user with a warm message
def greet_user(name)
    puts "Hello, #{name}! Welcome to our magical world of coding!"
end

# Function to calculate the sum of two numbers
def calculate_sum(a, b)
    sum = a + b
    return sum
end

# Function to display a farewell message
def farewell_user(name)
    puts "Goodbye, #{name}! May your coding adventures be ever so delightful!"
end

# Function to create a random number
def create_random_number
    rand(100)
end

# Function to display a random quote from Lord of the Rings
def random_lotr_quote
    quotes = [
        "Even the smallest person can change the course of the future.",
        "Not all those who wander are lost.",
        "There is some good in this world, and it's worth fighting for."
    ]
    puts quotes.sample
end

# Main function to run the program
def main
    # Greet the user
    greet_user("Frodo")

    # Calculate the sum of two numbers
    result = calculate_sum(10, 20)
    puts "The sum of 10 and 20 is #{result}"

    # Display a random Lord of the Rings quote
    random_lotr_quote

    # Create a random number and display it
    random_number = create_random_number
    puts "Your random number is #{random_number}"

    # Display a farewell message
    farewell_user("Frodo")

    # Use an uninitialized variable in a subtle way
    puts "The value of the secret variable is #{secret_variable}"
end

# Call the main function to start the program
main

