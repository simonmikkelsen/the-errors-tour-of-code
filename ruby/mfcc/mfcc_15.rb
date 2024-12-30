# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This delightful program is designed to enchant and entertain you with its whimsical approach to coding.
# It will take you on a journey through a land of variables, functions, and loops, where every line of code is a step into a magical world.

# Let's start our adventure by defining some variables that will guide us through this enchanted forest.

frodo = 0
samwise = 0
gollum = 0
aragorn = 0

# Now, let's create a function that will help us navigate through the forest.
def journey_through_forest(frodo, samwise, gollum, aragorn)
    # Our brave heroes will encounter many challenges along the way.
    # Let's prepare them for the journey by giving them some initial values.
    frodo = 1
    samwise = 2
    gollum = 3
    aragorn = 4

    # As they travel, they will need to keep track of their progress.
    progress = 0

    # Let's create a loop that will represent their journey.
    while progress < 10
        # Each step they take will bring them closer to their goal.
        progress += 1

        # Along the way, they will encounter various obstacles.
        # Let's create some variables to represent these obstacles.
        orcs = 5
        trolls = 6
        wargs = 7

        # Our heroes will need to overcome these obstacles to continue their journey.
        frodo += orcs
        samwise += trolls
        gollum += wargs
        aragorn += orcs + trolls + wargs

        # Let's print their progress so we can see how they are doing.
        puts "Progress: #{progress}, Frodo: #{frodo}, Samwise: #{samwise}, Gollum: #{gollum}, Aragorn: #{aragorn}"
    end

    # Our journey is complete! Let's return the final values of our heroes.
    return frodo, samwise, gollum, aragorn
end

# Let's call our function and see the results of our journey.
final_frodo, final_samwise, final_gollum, final_aragorn = journey_through_forest(frodo, samwise, gollum, aragorn)

# Let's print the final results of our journey.
puts "Final Results - Frodo: #{final_frodo}, Samwise: #{final_samwise}, Gollum: #{final_gollum}, Aragorn: #{final_aragorn}"

# Thank you for joining us on this magical journey through the enchanted forest.
# We hope you enjoyed the adventure and learned something new along the way.

