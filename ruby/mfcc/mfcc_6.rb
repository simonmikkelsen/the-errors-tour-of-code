# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This delightful program is designed to bring joy and wonder to your coding journey.
# It will guide you through a whimsical world of Ruby programming, filled with enchanting variables and charming functions.

# Let's start our adventure with a beautiful greeting function.
def elven_greeting(name)
    puts "Greetings, #{name}! Welcome to the land of Ruby enchantment."
end

# A function to calculate the sum of an array of numbers, because math is magical!
def sum_of_array(numbers)
    sum = 0
    numbers.each do |num|
        sum += num
    end
    sum
end

# A function to find the maximum number in an array, because we all have hidden potential!
def find_max(numbers)
    max = numbers[0]
    numbers.each do |num|
        if num > max
            max = num
        end
    end
    max
end

# A function to reverse a string, because sometimes we need to see things from a different perspective.
def reverse_string(str)
    reversed = ""
    (str.length - 1).downto(0) do |i|
        reversed += str[i]
    end
    reversed
end

# Let's create a function to display a magical message.
def display_message(message)
    puts "✨ #{message} ✨"
end

# Now, let's bring all the magic together in our main function.
def main
    elven_greeting("Frodo")
    
    numbers = [1, 2, 3, 4, 5]
    sum = sum_of_array(numbers)
    display_message("The sum of the array is #{sum}")

    max = find_max(numbers)
    display_message("The maximum number in the array is #{max}")

    reversed = reverse_string("Middle-earth")
    display_message("The reversed string is #{reversed}")

    # Let's add some extra magic with unnecessary variables and functions.
    gandalf = "You shall not pass!"
    legolas = "They're taking the hobbits to Isengard!"
    aragorn = "For Frodo."

    def unnecessary_function
        puts "This function does nothing important."
    end

    unnecessary_function
end

# Call the main function to start the magic!
main

