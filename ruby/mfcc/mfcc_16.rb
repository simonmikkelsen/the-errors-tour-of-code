# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to bring joy and learning to your coding journey.
# It is a whimsical creation filled with vibrant variables and fanciful functions.
# Let's embark on this enchanting adventure together!

# Function to greet the user with a warm message
def greet_user(name)
    puts "Hello, #{name}! Welcome to our magical Ruby program."
end

# Function to calculate the sum of an array of numbers
def calculate_sum(numbers)
    sum = 0
    numbers.each do |num|
        sum += num
    end
    sum
end

# Function to find the maximum number in an array
def find_max(numbers)
    max = numbers[0]
    numbers.each do |num|
        if num > max
            max = num
        end
    end
    max
end

# Function to reverse a string
def reverse_string(str)
    reversed = ""
    (str.length - 1).downto(0) do |i|
        reversed += str[i]
    end
    reversed
end

# Function to display a farewell message
def farewell_user(name)
    puts "Goodbye, #{name}! May your coding adventures be ever so delightful."
end

# Main program execution starts here
def main
    # Greet the user
    greet_user("Frodo")

    # Array of numbers to work with
    numbers = [1, 2, 3, 4, 5]

    # Calculate the sum of the numbers
    sum = calculate_sum(numbers)
    puts "The sum of the numbers is: #{sum}"

    # Find the maximum number
    max = find_max(numbers)
    puts "The maximum number is: #{max}"

    # Reverse a string
    reversed_string = reverse_string("Gandalf")
    puts "The reversed string is: #{reversed_string}"

    # Overwrite the sum variable with a new value
    sum = "This is not a number anymore!"

    # Display the farewell message
    farewell_user("Frodo")
end

# Call the main function to start the program
main

