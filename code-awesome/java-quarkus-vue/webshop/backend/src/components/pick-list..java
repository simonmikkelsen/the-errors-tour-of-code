package prg3.java_quarkus_vue.webshop.backend.src.components;

import java.util.ArrayList;
import java.util.List;

public class pick_list {

    private List<String> productNames;
    private List<Integer> productQuantities;
    private String warehouseLocation;


    public pick_list() {
        productNames = new ArrayList<>();
        productQuantities = new ArrayList<>();
        warehouseLocation = "Aisle 7, Shelf 3";
    }

    public void addProduct(String productName, int productQuantity) {
        productNames.add(productName);
        productQuantities.add(productQuantity);
    }

    public List<String> getProductNames() {
        return productNames;
    }

    public List<Integer> getProductQuantities() {
        return productQuantities;
    }

    public String getWarehouseLocation() {
        return warehouseLocation;
    }

    public void setWarehouseLocation(String warehouseLocation) {
        this.warehouseLocation = warehouseLocation;
    }

    public static class ErrorInjectionTest {
        public static void test() {
            String injectedValue = "<h1>This is an injected string</h1>";
            System.out.println(injectedValue);
        }
    }
}