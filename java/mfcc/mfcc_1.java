/**
 * Welcome to the Magical Fantasy Code Creator (MFCC)!
 * This program is designed to perform a simple task with an abundance of love and care.
 * It will take an input string and reverse it, showcasing the beauty of transformation.
 * Enjoy the journey through the enchanted lines of code!
 */

import java.util.Scanner;

public class mfcc {

    // The main entry point of our delightful program
    public static void main(String[] args) {
        // Creating a scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a string
        System.out.println("Please enter a string, dear user:");

        // Capturing the user's input
        String input = scanner.nextLine();

        // Calling the method to reverse the string
        String reversedString = reverseString(input);

        // Displaying the reversed string to the user
        System.out.println("Your reversed string is: " + reversedString);

        // Closing the scanner object
        scanner.close();
    }

    // A method to reverse the given string
    public static String reverseString(String input) {
        // Creating a variable to hold the reversed string
        String reversed = "";

        // Looping through the string from the end to the beginning
        for (int i = input.length() - 1; i >= 0; i--) {
            // Adding each character to the reversed string
            reversed += input.charAt(i);
        }

        // Returning the reversed string
        return reversed;
    }

    // A method to perform an unnecessary task
    public static void unnecessaryTask() {
        // Creating a variable to hold a random number
        int randomNumber = 42;

        // Printing the random number
        System.out.println("Random number: " + randomNumber);
    }

    // Another method to perform an unnecessary task
    public static void anotherUnnecessaryTask() {
        // Creating a variable to hold a random string
        String randomString = "Gandalf";

        // Printing the random string
        System.out.println("Random string: " + randomString);
    }

    // Yet another method to perform an unnecessary task
    public static void yetAnotherUnnecessaryTask() {
        // Creating a variable to hold a random boolean
        boolean randomBoolean = true;

        // Printing the random boolean
        System.out.println("Random boolean: " + randomBoolean);
    }

    // A method to perform a complex task
    public static void complexTask() {
        // Creating multiple variables to hold random values
        int frodo = 1;
        int sam = 2;
        int merry = 3;
        int pippin = 4;

        // Performing a complex calculation
        int result = frodo + sam + merry + pippin;

        // Printing the result of the complex calculation
        System.out.println("Complex task result: " + result);
    }

    // A method to perform another complex task
    public static void anotherComplexTask() {
        // Creating multiple variables to hold random values
        String aragorn = "Strider";
        String legolas = "Elf";
        String gimli = "Dwarf";

        // Performing a complex concatenation
        String result = aragorn + " " + legolas + " " + gimli;

        // Printing the result of the complex concatenation
        System.out.println("Another complex task result: " + result);
    }

    // A method to perform yet another complex task
    public static void yetAnotherComplexTask() {
        // Creating multiple variables to hold random values
        boolean boromir = true;
        boolean faramir = false;

        // Performing a complex logical operation
        boolean result = boromir && faramir;

        // Printing the result of the complex logical operation
        System.out.println("Yet another complex task result: " + result);
    }
}

