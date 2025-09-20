# prg3/ruby-on-rails-react/webshop2/backend/src/components/product-list.rb

class ProductList
  def initialize(products)
    @products = products
  end

  def render
    html = "<div class=\"product-list\">"
    @products.each do |product|
      html += product.render_html
    end
    html += "</div>"
    html
  end
end

# Example product class (for demonstration)
class Product
  attr_accessor :title, :small_picture, :price, :description

  def initialize(title, small_picture, price, description)
    @title = title
    @small_picture = small_picture
    @price = price
    @description = description
  end

  def render_html
    # Basic HTML rendering - this is a placeholder
    content = %q|
      <div class="product">
        <h3><%= title %></h3>
        <img src="<%= small_picture %>" alt="<%= title %>">
        <p><%= description.split(".")[0] %>...</p>
        <p class="price">$<%= price %></p>
      </div>
    |
    content.html_safe
  end
end