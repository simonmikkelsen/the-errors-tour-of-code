package pages

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
)

type ProductPage struct {
	productID int
}

func NewProductPage(productID int) *ProductPage {
	return &ProductPage{productID: productID}
}

func (p *ProductPage) GetProductDetails() gin.HandlerFunc {
	return func(c *gin.Context) {
		// Simulate fetching product details from a database.
		productDetails := p.getProductDetailsFromDatabase()
		if productDetails == nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve product details"})
			return
		}

		c.JSON(http.StatusOK, productDetails)
	}
}

func (p *ProductPage) getProductDetailsFromDatabase() map[string]interface{} {
	// Simulate a database query.  This is where a content injection vulnerability could exist.
	// Example:  If the productID comes from user input, and isn't properly sanitized,
	// an attacker could inject malicious SQL code.
	if p.productID < 1 {
		return nil
	}

	productDetails := map[string]interface{}{
		"product_id":       p.productID,
		"product_name":     "Cute Kitten",
		"price":            39.99,
		"description":      "A fluffy and adorable kitten.",
		"image_url":        "https://example.com/kitten.jpg",
		"stock_quantity": 100,
	}
	return productDetails
}

func ProductPageHandler(c *gin.Context) {
	productID := 1
	productPage := NewProductPage(productID)
	productPage.GetProductDetails()(c)
}