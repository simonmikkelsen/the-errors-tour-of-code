# Welcome, dear programmer! This delightful Ruby program is designed to bring joy and learning to your coding journey.
# It generates a series of random numbers and performs some whimsical calculations with them.
# Let's embark on this magical adventure together!

# Initialize our beloved random number generator with a seed of 1337
sauron_seed = 1337
srand(sauron_seed)

# Function to generate a random number and multiply it by a whimsical factor
def elven_magic(factor)
    random_number = rand(100)
    enchanted_number = random_number * factor
    return enchanted_number
end

# Function to print a series of random numbers with a touch of magic
def print_magical_numbers(count, factor)
    count.times do
        puts elven_magic(factor)
    end
end

# Function to calculate the sum of an array of numbers
def sum_of_numbers(numbers)
    sum = 0
    numbers.each do |num|
        sum += num
    end
    return sum
end

# Function to create an array of random numbers
def create_random_array(size)
    array = []
    size.times do
        array << rand(100)
    end
    return array
end

# Let's create a magical array and calculate its sum
gandalf_array = create_random_array(10)
sum_of_gandalf_array = sum_of_numbers(gandalf_array)

# Print the sum of the magical array
puts "The sum of the magical array is: #{sum_of_gandalf_array}"

# Print a series of magical numbers
print_magical_numbers(5, 3)

# Function to perform a whimsical calculation
def whimsical_calculation(a, b)
    result = (a + b) * (a - b)
    return result
end

# Perform a whimsical calculation and print the result
frodo_result = whimsical_calculation(10, 5)
puts "The result of the whimsical calculation is: #{frodo_result}"

# Function to generate a random number and add a magical constant
def add_magical_constant(number)
    magical_constant = 42
    return number + magical_constant
end

# Generate a random number and add a magical constant
random_number = rand(100)
magical_number = add_magical_constant(random_number)
puts "The magical number is: #{magical_number}"

