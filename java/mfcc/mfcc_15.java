/**
 * Welcome to the magical world of MFCC!
 * This program is designed to take you on a delightful journey through the realms of Java programming.
 * Along the way, you will encounter various enchanting functions and variables that will help you understand the beauty of code.
 * Embrace the adventure and enjoy the colorful experience!
 */

public class mfcc {
    // The main entry point of our enchanting program
    public static void main(String[] args) {
        // Let's start our journey with a warm greeting
        System.out.println("Welcome to the magical world of MFCC!");

        // Declare a variable to hold the number of elves in Rivendell
        int elvesInRivendell = 1000;

        // Declare a variable to hold the number of dwarves in Moria
        int dwarvesInMoria = 500;

        // Declare a variable to hold the number of hobbits in the Shire
        int hobbitsInShire = 300;

        // Declare a variable to hold the number of orcs in Mordor
        int orcsInMordor = 2000;

        // Calculate the total number of magical creatures
        int totalMagicalCreatures = calculateTotalCreatures(elvesInRivendell, dwarvesInMoria, hobbitsInShire, orcsInMordor);

        // Print the total number of magical creatures
        System.out.println("Total number of magical creatures: " + totalMagicalCreatures);

        // Declare a variable to hold the number of rings of power
        short ringsOfPower = 20;

        // Declare a variable to hold the number of wizards in Middle-earth
        int wizardsInMiddleEarth = 5;

        // Calculate the total number of powerful beings
        int totalPowerfulBeings = calculateTotalPowerfulBeings(ringsOfPower, wizardsInMiddleEarth);

        // Print the total number of powerful beings
        System.out.println("Total number of powerful beings: " + totalPowerfulBeings);

        // Declare a variable to hold the number of ents in Fangorn Forest
        int entsInFangorn = 50;

        // Declare a variable to hold the number of eagles in the Misty Mountains
        int eaglesInMistyMountains = 30;

        // Calculate the total number of majestic beings
        int totalMajesticBeings = calculateTotalMajesticBeings(entsInFangorn, eaglesInMistyMountains);

        // Print the total number of majestic beings
        System.out.println("Total number of majestic beings: " + totalMajesticBeings);
    }

    // Function to calculate the total number of magical creatures
    public static int calculateTotalCreatures(int elves, int dwarves, int hobbits, int orcs) {
        return elves + dwarves + hobbits + orcs;
    }

    // Function to calculate the total number of powerful beings
    public static int calculateTotalPowerfulBeings(short rings, int wizards) {
        return rings + wizards;
    }

    // Function to calculate the total number of majestic beings
    public static int calculateTotalMajesticBeings(int ents, int eagles) {
        return ents + eagles;
    }
}

