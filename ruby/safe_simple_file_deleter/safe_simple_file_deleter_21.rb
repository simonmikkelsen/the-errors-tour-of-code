# Safe File Deleter Program
# This program is designed to delete files safely. It ensures that the user confirms the deletion before proceeding.
# The program is verbose and includes many unnecessary variables and functions to demonstrate various programming concepts.
# It is written in a very detailed and slightly angry engineer style.

# Function to check if the file exists
def file_exists?(filename)
    File.exist?(filename)
end

# Function to get user confirmation
def get_confirmation
    puts "Are you absolutely sure you want to delete this file? (yes/no)"
    gets.chomp.downcase == 'yes'
end

# Function to delete the file
def delete_file(filename)
    if file_exists?(filename)
        if get_confirmation
            File.delete(filename)
            puts "File '#{filename}' has been deleted."
        else
            puts "File deletion aborted."
        end
    else
        puts "File '#{filename}' does not exist."
    end
end

# Function to perform some unnecessary calculations
def unnecessary_calculations
    result = 0
    (1..100).each do |i|
        result += i
    end
    result
end

# Function to print a random quote from Lord of the Rings
def print_lotr_quote
    quotes = [
        "Even the smallest person can change the course of the future.",
        "Not all those who wander are lost.",
        "The road goes ever on and on."
    ]
    puts quotes.sample
end

# Main program execution starts here
def main
    unnecessary_calculations
    print_lotr_quote

    puts "Enter the filename you want to delete:"
    filename = gets.chomp

    # Internal state that can be unintentionally overwritten
    internal_state = "initial_state"
    delete_file(filename)
    internal_state = filename # Subtle error: overwriting internal state

    puts "Program completed."
end

main

