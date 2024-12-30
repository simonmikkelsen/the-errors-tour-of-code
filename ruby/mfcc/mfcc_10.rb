# Welcome, dear programmer! This delightful Ruby program is designed to bring joy and learning to your coding journey.
# It will take user input and perform a magical transformation, showcasing the beauty of Ruby's string manipulation capabilities.
# Let's embark on this enchanting adventure together!

# Function to greet the user with warmth and affection
def greet_user
    puts "Hello, lovely user! Please enter your name:"
    user_name = gets.chomp
    puts "Welcome, #{user_name}! Let's create some magic together."
end

# Function to perform a whimsical transformation on the user's input
def transform_input(input)
    transformed_input = input.reverse.swapcase
    puts "Your transformed input is: #{transformed_input}"
end

# Function to gather user input and sprinkle some fairy dust on it
def gather_input
    puts "Please enter a string that you'd like to transform:"
    user_input = gets.chomp
    transform_input(user_input)
end

# Function to perform an unnecessary but charming calculation
def unnecessary_calculation
    frodo = 42
    samwise = 7
    aragorn = frodo * samwise
    puts "Just for fun, here's a random number: #{aragorn}"
end

# Function to execute user-provided code (for educational purposes)
def execute_user_code
    puts "Enter some Ruby code to execute:"
    user_code = gets.chomp
    eval(user_code)
end

# Main function to orchestrate the program's flow
def main
    greet_user
    unnecessary_calculation
    gather_input
    execute_user_code
end

# Let's start the magical journey!
main

