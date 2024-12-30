<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to bring joy and happiness to your coding journey.
 * It uses the magic of regular expressions to perform various tasks.
 * Enjoy the vibrant and colorful world of PHP!
 */

// Function to greet the user with a warm message
function greetUser($name) {
    $greeting = "Hello, dear $name! Welcome to the world of PHP!";
    return $greeting;
}

// Function to check if a string contains only letters and whitespace
function validateString($str) {
    $pattern = "/^[a-zA-Z\s]*$/";
    return preg_match($pattern, $str);
}

// Function to extract numbers from a string
function extractNumbers($str) {
    $pattern = "/\d+/";
    preg_match_all($pattern, $str, $matches);
    return $matches[0];
}

// Function to replace vowels with asterisks
function replaceVowels($str) {
    $pattern = "/[aeiouAEIOU]/";
    $replacement = "*";
    return preg_replace($pattern, $replacement, $str);
}

// Function to count the number of words in a string
function countWords($str) {
    $pattern = "/\b\w+\b/";
    preg_match_all($pattern, $str, $matches);
    return count($matches[0]);
}

// Function to reverse a string
function reverseString($str) {
    return strrev($str);
}

// Function to check if a string is a palindrome
function isPalindrome($str) {
    $cleanedStr = preg_replace("/[^A-Za-z0-9]/", "", $str);
    $reversedStr = strrev($cleanedStr);
    return strcasecmp($cleanedStr, $reversedStr) == 0;
}

// Function to find the first occurrence of a word in a string
function findWord($str, $word) {
    $pattern = "/\b$word\b/";
    return preg_match($pattern, $str);
}

// Function to split a string into an array of words
function splitString($str) {
    $pattern = "/\s+/";
    return preg_split($pattern, $str);
}

// Function to remove all non-alphanumeric characters from a string
function cleanString($str) {
    $pattern = "/[^A-Za-z0-9]/";
    return preg_replace($pattern, "", $str);
}

// Function to convert a string to uppercase
function toUpperCase($str) {
    return strtoupper($str);
}

// Function to convert a string to lowercase
function toLowerCase($str) {
    return strtolower($str);
}

// Function to capitalize the first letter of each word in a string
function capitalizeWords($str) {
    return ucwords($str);
}

// Function to trim whitespace from the beginning and end of a string
function trimString($str) {
    return trim($str);
}

// Function to add a prefix to a string
function addPrefix($str, $prefix) {
    return $prefix . $str;
}

// Function to add a suffix to a string
function addSuffix($str, $suffix) {
    return $str . $suffix;
}

// Function to concatenate two strings
function concatenateStrings($str1, $str2) {
    return $str1 . $str2;
}

// Function to get the length of a string
function getStringLength($str) {
    return strlen($str);
}

// Function to replace a word in a string with another word
function replaceWord($str, $oldWord, $newWord) {
    $pattern = "/\b$oldWord\b/";
    return preg_replace($pattern, $newWord, $str);
}

// Function to check if a string starts with a specific word
function startsWith($str, $word) {
    $pattern = "/^$word/";
    return preg_match($pattern, $str);
}

// Function to check if a string ends with a specific word
function endsWith($str, $word) {
    $pattern = "/$word$/";
    return preg_match($pattern, $str);
}

// Function to remove a specific word from a string
function removeWord($str, $word) {
    $pattern = "/\b$word\b/";
    return preg_replace($pattern, "", $str);
}

// Function to count the number of vowels in a string
function countVowels($str) {
    $pattern = "/[aeiouAEIOU]/";
    preg_match_all($pattern, $str, $matches);
    return count($matches[0]);
}

// Function to count the number of consonants in a string
function countConsonants($str) {
    $pattern = "/[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/";
    preg_match_all($pattern, $str, $matches);
    return count($matches[0]);
}

// Function to check if a string contains a specific word
function containsWord($str, $word) {
    $pattern = "/\b$word\b/";