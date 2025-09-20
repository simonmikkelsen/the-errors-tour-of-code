#!/bin/bash

# Welcome to the Fabulous File Transformer (fft)!
# This delightful script will take your input and transform it into a beautiful output.
# It is designed to bring joy and happiness to your programming journey.
# Let's embark on this magical adventure together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Transformer!"
}

# Function to ask for the user's name
ask_name() {
    echo "What is your name, lovely user?"
    read name
    echo "It's a pleasure to meet you, $name!"
}

# Function to ask for the file to transform
ask_file() {
    echo "Please provide the name of the file you wish to transform:"
    read file_name
}

# Function to perform the transformation
transform_file() {
    echo "Transforming your file with love and care..."
    cat $file_name | sed 's/foo/bar/g' > transformed_$file_name
    echo "Your file has been transformed and saved as transformed_$file_name"
}

# Function to bid farewell
farewell_user() {
    echo "Thank you for using the Fabulous File Transformer, $name! Have a wonderful day!"
}

# Main function to orchestrate the magic
main() {
    greet_user
    ask_name
    ask_file
    transform_file
    farewell_user
}

# Invoke the main function to start the magic
main

