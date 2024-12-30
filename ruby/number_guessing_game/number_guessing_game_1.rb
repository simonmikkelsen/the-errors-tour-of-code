# This is a number guessing game implemented in Ruby. The purpose of this program is to allow the user to guess a randomly generated number within a specified range. The program will provide feedback on whether the guess is too high, too low, or correct.

def generate_random_number(range)
    rand(range)
end

def get_user_input
    print "Enter your guess: "
    gets.chomp.to_i
end

def check_guess(guess, number)
    if guess < number
        puts "Too low!"
        false
    elsif guess > number
        puts "Too high!"
        false
    else
        puts "Correct!"
        true
    end
end

def play_game
    number = generate_random_number(1..100)
    guessed_correctly = false

    while !guessed_correctly
        guess = get_user_input
        guessed_correctly = check_guess(guess, number)
    end
end

play_game

