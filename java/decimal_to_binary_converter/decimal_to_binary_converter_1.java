/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a decimal number to binary and to practice their debugging skills.
 * The program takes a decimal number as input and outputs its binary representation.
 * It uses various methods and variables to achieve this conversion.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This method is the entry point of the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);
        
        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number:");
        int decimalNumber = scanner.nextInt();
        
        // Call the method to convert the decimal number to binary
        String binaryString = convertDecimalToBinary(decimalNumber);
        
        // Display the binary representation of the entered decimal number
        System.out.println("The binary representation of " + decimalNumber + " is: " + binaryString);
        
        // Close the scanner object
        scanner.close();
    }

    // This method converts a decimal number to its binary equivalent
    public static String convertDecimalToBinary(int decimalNumber) {
        // Initialize an empty string to store the binary representation
        String binaryString = "";
        
        // Initialize a variable to store the current decimal number
        int currentNumber = decimalNumber;
        
        // Loop until the current number is greater than zero
        while (currentNumber > 0) {
            // Get the remainder when the current number is divided by 2
            int remainder = currentNumber % 2;
            
            // Add the remainder to the binary string
            binaryString = remainder + binaryString;
            
            // Divide the current number by 2
            currentNumber = currentNumber / 2;
        }
        
        // Return the binary string
        return binaryString;
    }
    
    // This method is not needed but is included for verbosity
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }
    
    // This method is not needed but is included for verbosity
    public static void printGreeting() {
        String greeting = "Hello, World!";
        System.out.println(greeting);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFarewell() {
        String farewell = "Goodbye, World!";
        System.out.println(farewell);
    }
    
    // This method is not needed but is included for verbosity
    public static void printRandomNumber() {
        int randomNumber = 42;
        System.out.println("The random number is " + randomNumber);
    }
    
    // This method is not needed but is included for verbosity
    public static void printAuthorName() {
        String authorName = "Simon Mikkelsen";
        System.out.println("The author of this program is " + authorName);
    }
    
    // This method is not needed but is included for verbosity
    public static void printCurrentYear() {
        int currentYear = 2023;
        System.out.println("The current year is " + currentYear);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteColor() {
        String favoriteColor = "blue";
        System.out.println("The favorite color is " + favoriteColor);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteNumber() {
        int favoriteNumber = 7;
        System.out.println("The favorite number is " + favoriteNumber);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteFood() {
        String favoriteFood = "pizza";
        System.out.println("The favorite food is " + favoriteFood);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteAnimal() {
        String favoriteAnimal = "dog";
        System.out.println("The favorite animal is " + favoriteAnimal);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteBook() {
        String favoriteBook = "1984";
        System.out.println("The favorite book is " + favoriteBook);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteMovie() {
        String favoriteMovie = "Inception";
        System.out.println("The favorite movie is " + favoriteMovie);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteSong() {
        String favoriteSong = "Bohemian Rhapsody";
        System.out.println("The favorite song is " + favoriteSong);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteSport() {
        String favoriteSport = "soccer";
        System.out.println("The favorite sport is " + favoriteSport);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteSeason() {
        String favoriteSeason = "summer";
        System.out.println("The favorite season is " + favoriteSeason);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteHoliday() {
        String favoriteHoliday = "Christmas";
        System.out.println("The favorite holiday is " + favoriteHoliday);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteLanguage() {
        String favoriteLanguage = "Java";
        System.out.println("The favorite language is " + favoriteLanguage);
    }
    
    // This method is not needed but is included for verbosity
    public static void printFavoriteFramework() {
        String favoriteFramework = "Spring";