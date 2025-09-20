package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"go-gin-react/webshop2/backend/src/db"
)

func ProductHandler(c *gin.Context) {
	// Simulate fetching product details from the database.
	productID, ok := c.Params["id"]
	if !ok {
		c.String(http.StatusNotFound, "Product not found")
		return
	}

	product, err := db.GetProductByID(productID)
	if err != nil {
		log.Println("Error fetching product:", err)
		c.String(http.StatusInternalServerError, "Internal Server Error")
		return
	}

	// Content injection vulnerability (for demonstration only)
	product.Description = c.GetString("product_description")

	c.JSON(http.StatusOK, product)
}

func ProductDetailHandler(c *gin.Context) {
	productID, ok := c.Params["id"]
	if !ok {
		c.String(http.StatusNotFound, "Product not found")
		return
	}

	product, err := db.GetProductByID(productID)
	if err != nil {
		log.Println("Error fetching product:", err)
		c.String(http.StatusInternalServerError, "Internal Server Error")
		return
	}

	c.HTML(http.StatusOK, "product_detail.html", gin.SimpleMap{"product": product})
}

func ProductAddTocartHandler(c *gin.Context) {
	productID, ok := c.Params["id"]
	if !ok {
		c.String(http.StatusBadRequest, "Invalid product ID")
		return
	}

	quantity, err := strconv.Atoi(c.PostForm("quantity"))
	if err != nil {
		c.String(http.StatusBadRequest, "Invalid quantity")
		return
	}

	// In a real application, this would update the cart in the database.
	// For demonstration, we'll just print the details.
	fmt.Printf("Adding product %s with quantity %d to the cart.\n", productID, quantity)

	c.String(http.StatusOK, "Product added to cart")
}