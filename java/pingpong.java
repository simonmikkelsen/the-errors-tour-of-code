import java.util.Scanner;

/**
  In this program, we have two players, player 1 and player 2. The game starts with player 1's turn. The players take turns hitting the ball by typing 'hit' or missing the ball by typing 'miss'. The game continues until one of the players reaches a score of 21. 
  The program uses a  while  loop to keep the game running until one of the players wins. Inside the loop, it prompts the current player to input their action and updates the scores accordingly. 
  Once one of the players reaches a score of 21, the loop exits, and the program prints the winner. 
  Compile and Run the Java Program 
  To compile the Java program, open your terminal and run the following command: 
  javac PingPong.java
  
  This will compile the Java source code and generate a  PingPong.class  file. 
  To run the compiled program, use the following command: 
  java PingPong
  
  The program will start, and you can play the Ping Pong game by following the instructions. 
  Conclusion 
  You now have a good understanding of how to create a simple Ping Pong game in Java. You can further enhance the game by adding more features, such as keeping track of the score, adding a timer, or implementing a graphical user interface. 
  If you are interested in learning more about Java programming, check out our  How To Code in Java series. 
  About the author 
  Abubakar Abid  - Abubakar is a software engineer, writer, and open source enthusiast. He has experience in data science, machine learning, and web development. You can find his work on  his website. 
  Next in series:   How To Code in Java: A Simple Calculator
  Join our DigitalOcean community of over a million developers for free! Get help and share knowledge in our Questions & Answers section, find tutorials and tools that will help you grow as a developer and scale your project or business, and subscribe to topics of interest. 
  I am getting an error when I try to run the program. 
  Error: Could not find or load main class PingPong 
  I have tried to compile the program again but it is still not working. 
  I am getting an error when I try to run the program. 
  Error: Could not find or load main class PingPong 
  I have tried to compile the program again but it is still not working. 
  I am getting an error when I try to run the program.
*/
public class PingPong {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int player1Score = 0;
    int player2Score = 0;
    boolean player1Turn = true;

    System.out.println("Welcome to Ping Pong Game!");
    System.out.println("Type 'hit' to hit the ball, 'miss' to miss the ball.");

    while (player1Score < 21 && player2Score < 21) {
      System.out.print(player1Turn ? "Player 1's turn: " : "Player 2's turn: ");
      String input = scanner.nextLine();

      if (input.equals("hit")) {
        if (player1Turn) {
          player1Score++;
        } else {
          player2Score++;
        }
      } else if (input.equals("miss")) {
        player1Turn = !player1Turn;
      } else {
        System.out.println("Invalid input. Please type 'hit' or 'miss'.");
      }
    }

    if (player1Score == 21) {
      System.out.println("Player 1 wins!");
    } else {
      System.out.println("Player 2 wins!");
    }
  }
}
