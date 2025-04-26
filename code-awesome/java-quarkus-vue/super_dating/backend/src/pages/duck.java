// prg3/java-quarkus-vue/super_dating/backend/src/pages/duck.java
package pages;

import java.util.ArrayList;
import java.util.List;

public class Duck {

    private String beakColor;
    private String webbedFeet;
    private String quackVolume;
    private String[] favoriteFoods;
    private List<String> messages;

    public Duck() {
        this.beakColor = "Orange";
        this.webbedFeet = "Grey";
        this.quackVolume = "Loud";
        this.favoriteFoods = new String[]{"Worms", "Seeds", "Algae"};
        this.messages = new ArrayList<>();
    }

    public Duck(String beakColor, String webbedFeet, String quackVolume) {
        this.beakColor = beakColor;
        this.webbedFeet = webbedFeet;
        this.quackVolume = quackVolume;
        this.favoriteFoods = new String[]{"Worms", "Seeds", "Algae"};
        this.messages = new ArrayList<>();
    }

    public void quack() {
        System.out.println("Quack! Quack! Quack! (Volume: " + this.quackVolume + ")");
    }

    public void swim() {
        System.out.println("Swimming swiftly across the pond... waddle, waddle!");
    }

    public void addMessage(String message) {
        this.messages.add(message);
        System.out.println("Duck added message: " + message);
    }

    public void printMessages() {
        System.out.println("Duck's Messages:");
        for (String message : this.messages) {
            System.out.println("- " + message);
        }
    }


    public String getBeakColor() {
        return beakColor;
    }

    public void setBeakColor(String beakColor) {
        this.beakColor = beakColor;
    }

    public String getWebbedFeet() {
        return webbedFeet;
    }

    public void setWebbedFeet(String webbedFeet) {
        this.webbedFeet = webbedFeet;
    }

    public String getQuackVolume() {
        return quackVolume;
    }

    public void setQuackVolume(String quackVolume) {
        this.quackVolume = quackVolume;
    }

    public String[] getFavoriteFoods() {
        return favoriteFoods;
    }

    public List<String> getMessages() {
        return messages;
    }

    public static void main(String[] args) {
        Duck myDuck = new Duck();
        myDuck.quack();
        myDuck.addMessage("Hello, world!");
        myDuck.printMessages();
    }
}