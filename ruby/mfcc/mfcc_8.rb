# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This program is a delightful journey through the enchanted lands of Ruby programming.
# Here, we will explore the beauty of code, the elegance of logic, and the charm of variables.
# Let's embark on this whimsical adventure together!

# Function to greet the user with a warm message
def greet_user(name)
    puts "Hello, #{name}! Welcome to the world of Ruby magic!"
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

# Function to create a beautiful array of random numbers
def create_random_array(size)
    array = []
    size.times do
        array << rand(100)
    end
    array
end

# Function to display the elements of an array in a charming way
def display_array(array)
    puts "Here are the magical numbers: #{array.join(', ')}"
end

# Function to perform a mysterious calculation
def mysterious_calculation(a, b)
    result = (a * b) + (a / b) - (a % b)
    result
end

# Function to summon the power of the One Ring
def one_ring_power(power_level)
    puts "The One Ring's power level is #{power_level}!"
end

# Main program execution starts here
greet_user("Frodo")

# Create a random array of numbers
numbers = create_random_array(10)

# Display the array
display_array(numbers)

# Calculate the sum of the numbers
sum = calculate_sum(numbers)
puts "The sum of the numbers is: #{sum}"

# Find the maximum number in the array
max_number = find_max(numbers)
puts "The maximum number is: #{max_number}"

# Perform a mysterious calculation
mystery_result = mysterious_calculation(42, 7)
puts "The result of the mysterious calculation is: #{mystery_result}"

# Summon the power of the One Ring
one_ring_power(100)

# End of the magical journey
puts "Thank you for joining us on this enchanting adventure!"

