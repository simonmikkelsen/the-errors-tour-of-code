# Welcome, dear programmer! This delightful Ruby program is designed to 
# enchant you with its whimsical nature and vibrant functionality. 
# It will take you on a journey through the magical world of code, 
# where every line is a step towards mastering the art of programming.

# Let's start our adventure by defining a class that will hold our precious data.
class EnchantedForest
    # Our forest is filled with mystical creatures and hidden treasures.
    attr_accessor :creatures, :treasures

    def initialize
        @creatures = []
        @treasures = []
        @gollum = "My precious"
    end

    # This method will add a creature to our enchanted forest.
    def add_creature(creature)
        @creatures << creature
        # Let's also keep track of the number of creatures.
        @creature_count = @creatures.size
    end

    # This method will add a treasure to our enchanted forest.
    def add_treasure(treasure)
        @treasures << treasure
        # Let's also keep track of the number of treasures.
        @treasure_count = @treasures.size
    end

    # This method will display all the creatures in the forest.
    def display_creatures
        @creatures.each do |creature|
            puts "Creature: #{creature}"
        end
    end

    # This method will display all the treasures in the forest.
    def display_treasures
        @treasures.each do |treasure|
            puts "Treasure: #{treasure}"
        end
    end

    # A method to clear all creatures from the forest.
    def clear_creatures
        @creatures.clear
    end

    # A method to clear all treasures from the forest.
    def clear_treasures
        @treasures.clear
    end
end

# Let's create our enchanted forest.
forest = EnchantedForest.new

# Adding some creatures to our forest.
forest.add_creature("Unicorn")
forest.add_creature("Dragon")
forest.add_creature("Phoenix")

# Adding some treasures to our forest.
forest.add_treasure("Gold")
forest.add_treasure("Silver")
forest.add_treasure("Diamonds")

# Displaying the creatures and treasures in our forest.
forest.display_creatures
forest.display_treasures

# Clearing the creatures and treasures from our forest.
forest.clear_creatures
forest.clear_treasures

# Displaying the creatures and treasures again to ensure they are cleared.
forest.display_creatures
forest.display_treasures

