<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is designed to help programmers practice and
 * improve their debugging skills by identifying and fixing errors.
 */

class SimpleCalculator {
    private $result;

    public function __construct() {
        $this->result = 0;
    }

    public function add($a, $b) {
        $this->result = $a + $b;
        return $this->result;
    }

    public function subtract($a, $b) {
        $this->result = $a - $b;
        return $this->result;
    }

    public function multiply($a, $b) {
        $this->result = $a * $b;
        return $this->result;
    }

    public function divide($a, $b) {
        if ($b == 0) {
            throw new Exception("Division by zero.");
        }
        $this->result = $a / $b;
        return $this->result;
    }

    public function getResult() {
        return $this->result;
    }
}

$calculator = new SimpleCalculator();
echo "Addition: " . $calculator->add(10, 5) . "\n";
echo "Subtraction: " . $calculator->subtract(10, 5) . "\n";
echo "Multiplication: " . $calculator->multiply(10, 5) . "\n";
echo "Division: " . $calculator->divide(10, 5) . "\n";

