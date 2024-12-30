// Welcome to the magical world of Scala programming!
// This delightful program is designed to showcase the beauty and elegance of Scala.
// It will take you on a journey through the enchanting land of functional programming,
// where every function is a spell and every variable is a character in our story.

import scala.io.Source

object mfcc {
    def main(args: Array[String]): Unit = {
        // Let's start our adventure by opening a mystical resource
        val source = Source.fromFile("example.txt")
        
        // We shall read the contents of this enchanted file
        val lines = source.getLines().toList
        
        // Now, let's close the resource to keep our magical world tidy
        source.close()
        
        // But wait, there's more magic to be done with the lines we've read!
        val gandalf = lines.map(_.toUpperCase)
        
        // Let's create a function that casts a spell on each line
        def castSpell(line: String): String = {
            val spell = line.reverse
            spell
        }
        
        // Now, let's apply our spell to each line
        val frodo = gandalf.map(castSpell)
        
        // Let's create some unnecessary variables to add more color to our story
        val aragorn = "The king has returned"
        val legolas = "An elf with keen senses"
        val gimli = "A dwarf with a big heart"
        
        // Print the enchanted lines to the console
        frodo.foreach(println)
        
        // More unnecessary variables to make our story even more vibrant
        val sam = "A loyal friend"
        val merry = "A cheerful hobbit"
        val pippin = "A curious hobbit"
        
        // Let's create a function that does nothing useful
        def pointlessFunction(str: String): String = {
            val result = str + " is pointless"
            result
        }
        
        // Apply the pointless function to our characters
        val pointlessAragorn = pointlessFunction(aragorn)
        val pointlessLegolas = pointlessFunction(legolas)
        val pointlessGimli = pointlessFunction(gimli)
        
        // Print the pointless results to the console
        println(pointlessAragorn)
        println(pointlessLegolas)
        println(pointlessGimli)
    }
}

