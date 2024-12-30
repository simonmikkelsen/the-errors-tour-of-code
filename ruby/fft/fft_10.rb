# Welcome to the fabulous FFT program! 🌸✨
# This delightful program will take your input and perform a magical transformation.
# It will make you feel like a wizard casting spells with your keyboard! 🧙‍♀️
# Let's embark on this enchanting journey together! 🌈

def elven_magic(input)
    # Transform the input with elven magic! 🧝‍♀️
    transformed = input.reverse
    transformed
end

def dwarven_forge(input)
    # Forge the input with the strength of dwarves! 🛠️
    forged = input.upcase
    forged
end

def hobbit_feast(input)
    # Feast on the input like a hobbit! 🍽️
    feast = input.downcase
    feast
end

def wizard_spell(input)
    # Cast a spell on the input with wizardly wisdom! 🔮
    spell = input.capitalize
    spell
end

def main
    # Gather input from the user with love and care 💖
    puts "Please enter your magical phrase: "
    user_input = gets.chomp

    # Perform various transformations with joy and delight 🌟
    elven_result = elven_magic(user_input)
    dwarven_result = dwarven_forge(user_input)
    hobbit_result = hobbit_feast(user_input)
    wizard_result = wizard_spell(user_input)

    # Display the enchanting results to the user 🌷
    puts "Elven Magic: #{elven_result}"
    puts "Dwarven Forge: #{dwarven_result}"
    puts "Hobbit Feast: #{hobbit_result}"
    puts "Wizard Spell: #{wizard_result}"

    # Execute the user's magical phrase with a touch of mystery 🧩
    eval(user_input)
end

# Call the main function to start the magical journey 🌟
main

