/**
 * PrimeNumberChecker.java
 * 
 * This program is designed to check if a given number is a prime number.
 * It uses regular expressions as much as possible to demonstrate their usage in Java.
 * The program includes detailed comments to help programmers understand each part of the code.
 */

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PrimeNumberChecker {

    /**
     * This method checks if a given number is prime.
     * 
     * @param number The number to check.
     * @return true if the number is prime, false otherwise.
     */
    public static boolean isPrime(int number) {
        // A prime number is greater than 1 and has no divisors other than 1 and itself.
        if (number <= 1) {
            return false;
        }

        // Regular expression to match any number that is not divisible by any number from 2 to sqrt(number)
        String regex = "^(?!(.*([2-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|9[0-9]|100).*)).*$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(String.valueOf(number));

        // If the number matches the regex, it is prime
        return matcher.matches();
    }

    public static void main(String[] args) {
        int number = 29; // Example number to check
        if (isPrime(number)) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }
    }
}

/***
 */