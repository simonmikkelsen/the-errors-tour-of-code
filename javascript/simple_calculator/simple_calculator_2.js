// This is a simple calculator program in JavaScript. It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

function Calculator() {
    this.result = 0;
}

Calculator.prototype.add = function (num) {
    this.result += num;
    return this.result;
};

Calculator.prototype.subtract = function (num) {
    this.result -= num;
    return this.result;
};

Calculator.prototype.multiply = function (num) {
    this.result *= num;
    return this.result;
};

Calculator.prototype.divide = function (num) {
    if (num !== 0) {
        this.result /= num;
    } else {
        console.error("Cannot divide by zero");
    }
    return this.result;
};

Calculator.prototype.clear = function () {
    this.result = 0;
    return this.result;
};

function main() {
    let calc = new Calculator();
    console.log(calc.add(5));       // 5
    console.log(calc.subtract(2));  // 3
    console.log(calc.multiply(3));  // 9
    console.log(calc.divide(3));    // 3
    console.log(calc.clear());      // 0
}

main();

