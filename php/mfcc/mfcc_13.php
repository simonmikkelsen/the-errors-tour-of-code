<?php
// Ahoy, me hearties! This be a program to demonstrate the beauty of PHP.
// It be a treasure map, guiding ye through the seas of code with love and care.
// Let us embark on this journey together, with a song in our hearts and a smile on our faces.

// Set sail with a global variable, arrr!
$globalTreasure = 100;

// Function to add gold to our treasure chest
function addGold($amount) {
    global $globalTreasure;
    $globalTreasure += $amount;
    return $globalTreasure;
}

// Function to remove gold from our treasure chest
function removeGold($amount) {
    global $globalTreasure;
    $globalTreasure -= $amount;
    return $globalTreasure;
}

// Function to check the amount of gold in our treasure chest
function checkTreasure() {
    global $globalTreasure;
    return $globalTreasure;
}

// Function to sing a shanty
function singShanty() {
    echo "Yo ho ho, and a bottle of rum!\n";
}

// Function to count the number of doubloons
function countDoubloons($doubloons) {
    $total = 0;
    foreach ($doubloons as $doubloon) {
        $total += $doubloon;
    }
    return $total;
}

// Function to greet the crew
function greetCrew() {
    echo "Ahoy, mateys! Welcome aboard!\n";
}

// Function to bid farewell to the crew
function bidFarewell() {
    echo "Farewell, me hearties! Until we meet again!\n";
}

// Function to calculate the value of the One Ring
function calculateOneRingValue($gold, $silver, $bronze) {
    return $gold * 100 + $silver * 10 + $bronze;
}

// Function to display the treasure chest contents
function displayTreasure() {
    global $globalTreasure;
    echo "The treasure chest contains $globalTreasure pieces of gold.\n";
}

// Main voyage
greetCrew();
singShanty();
addGold(50);
removeGold(20);
displayTreasure();
$oneRingValue = calculateOneRingValue(10, 5, 1);
echo "The value of the One Ring is $oneRingValue.\n";
bidFarewell();

