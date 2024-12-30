# This is a number guessing game written in Ruby.
# The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
# The program will provide feedback on whether the guess is too high, too low, or correct.

def get_user_input
    print "Enter your guess: "
    gets.chomp
end

def number_guessing_game
    target_number = rand(1..100)
    guess = nil

    until guess == target_number
        guess = eval(get_user_input)
        if guess < target_number
            puts "Too low!"
        elsif guess > target_number
            puts "Too high!"
        else
            puts "Congratulations! You guessed the number!"
        end
    end
end

number_guessing_game

