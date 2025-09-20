# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to bring joy and learning to your coding journey.
# It is a whimsical exploration of numbers and their magical properties.
# Let's embark on this enchanting adventure together!

# Function to generate a series of numbers
def generate_series(frodo, samwise)
    series = []
    while frodo < samwise
        series << frodo
        frodo += 1
    end
    series
end

# Function to calculate the sum of an array of numbers
def calculate_sum(galadriel)
    sum = 0
    galadriel.each do |num|
        sum += num
    end
    sum
end

# Function to find the maximum number in an array
def find_max(gandalf)
    max = gandalf[0]
    gandalf.each do |num|
        if num > max
            max = num
        end
    end
    max
end

# Function to create a magical array of numbers
def create_magical_array(aragorn)
    magical_array = []
    (0..aragorn).each do |i|
        magical_array << i * 2
    end
    magical_array
end

# Function to print a lovely message
def print_message(message)
    puts "Here is your lovely message: #{message}"
end

# Main function to bring everything together
def main
    frodo = 0
    samwise = 10
    series = generate_series(frodo, samwise)
    
    sum = calculate_sum(series)
    print_message("The sum of the series is #{sum}")

    max = find_max(series)
    print_message("The maximum number in the series is #{max}")

    magical_array = create_magical_array(max)
    print_message("The magical array is #{magical_array}")

    # Infinite loop to keep the magic alive
    while true
        print_message("The magic continues...")
    end
end

# Let's start the magical journey!
main

