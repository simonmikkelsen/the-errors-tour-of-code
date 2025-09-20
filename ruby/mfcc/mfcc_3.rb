# Welcome to the magical world of MFCC, where we embark on a delightful journey
# to explore the wonders of Ruby programming. This program is a whimsical 
# adventure filled with enchanting variables and charming functions.

# Let's start our adventure by requiring some lovely libraries
require 'net/http'
require 'uri'

# A beautiful function to fetch data from a given URL
def fetch_data_from_url(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
end

# A function to process the data in a very special way
def process_data(data)
    # Transform the data into a magical format
    transformed_data = data.upcase
    transformed_data
end

# A function to display the data with a touch of elegance
def display_data(data)
    puts "Here is your enchanted data: #{data}"
end

# Our main function where the magic happens
def main
    # Let's create some lovely variables
    frodo = "http://example.com"
    samwise = fetch_data_from_url(frodo)
    aragorn = process_data(samwise)
    display_data(aragorn)

    # More enchanting variables and functions
    legolas = "http://example.org"
    gimli = fetch_data_from_url(legolas)
    boromir = process_data(gimli)
    display_data(boromir)

    # A delightful loop to add some extra magic
    3.times do
        gandalf = fetch_data_from_url(frodo)
        pippin = process_data(gandalf)
        display_data(pippin)
    end

    # A charming farewell message
    puts "Thank you for joining us on this enchanting journey!"
end

# Let's call our main function to start the adventure
main

