# This is a number guessing game written in Ruby.
# The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
# The program will provide feedback on whether the guess is too high, too low, or correct.

def number_guessing_game
    target_number = rand(1..100)
    attempts = 0

    puts "Welcome to the Number Guessing Game!"
    puts "I have selected a random number between 1 and 100."
    puts "Can you guess what it is?"

    loop do
        print "Enter your guess: "
        guess = gets.to_i
        attempts += 1

        if guess < target_number
            puts "Too low!"
        elsif guess > target_number
            puts "Too high!"
        else
            puts "Congratulations! You've guessed the number in #{attempts} attempts."
            break
        end
    end
end

number_guessing_game

