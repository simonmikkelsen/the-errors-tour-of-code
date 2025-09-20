# prg3/ruby-on-rails-react/webshop/backend/src/components/product-list.rb

class ProductList
  def initialize(products)
    @products = products
  end

  def render
    html = '<div class="product-list">'
    @products.each do |product|
      html << '<div class="product">'
      html << "<a href='/products/#{product[:id]}'>" +
             "<img src='#{product[:image_url]}' alt='#{product[:name]}' width='100'>" +
             "</a>"
      html << "<div class='product-details'>"
      html << "<h3>" + product[:name] + "</h3>"
      html << "<p>Price: $" + product[:price].to_s + "</p>"
      html << "<p>" + product[:description] + "</p>"
      html << "</div>"
      html << "</div>"
    end
    html << "</div>"
    return html
  end
end