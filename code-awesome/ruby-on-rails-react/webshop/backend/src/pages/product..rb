# prg3/ruby-on-rails-react/webshop/backend/src/pages/product.rb
# Product Page - Displays a product and links to cart and checkout.

class ProductPage
  def initialize(product_data)
    @product = product_data
    @cart = Cart.new
    @checkout = CheckoutPage.new
  end

  def render
    content = <<~HTML
      <h1>#{@product.name}</h1>
      <img src="#{URLHelper.image_url(@product.image)}" alt="#{URLHelper.image_alt_text(@product.image)}" width="300">
      <p>Price: $#{@product.price}</p>
      <p>Description: #{@product.description}</p>
      <button onclick="location.href='#{URLHelper.cart_url}'" >Add to Cart</button>
      <button onclick="location.href='#{URLHelper.checkout_url}'" >Checkout</button>
    HTML
    return content
  end
end

# Helper Classes for URL Generation and Cart/Checkout Interaction
class URLHelper
  def self.image_url(image_path)
    "#{base_url}/images/#{image_path}"
  end

  def self.image_alt_text(image_path)
    "Image of #{image_path}"
  end

  def self.cart_url
    "/cart"
  end

  def self.checkout_url
    "/checkout"
  end

  def self.base_url
    "/webshop"
  end
end

class Cart
  def initialize
    # Placeholder for cart logic.  Currently, it does nothing.
  end

  def add_to_cart(product_id)
    # In a real implementation, this would update the cart data.
    puts "Adding product #{product_id} to cart."
  end
end

class CheckoutPage
  def initialize
    # Placeholder for checkout logic. Currently, it does nothing.
  end
end