# prg3/ruby-on-rails-react/webshop/backend/src/components/pick-list.rb

# This component generates a pick list based on product IDs.
# It assumes that the product IDs are valid and exist in the database.
# It also includes a simple error handling mechanism.

def generate_pick_list(product_ids)
    # Initialize an empty array to store the pick list items.
    pick_list = []

    # Iterate over the product IDs.
    product_ids.each do |product_id|
        # Fetch the product details from the database.
        # This part assumes a database connection and a product model.
        begin
            product = Product.find(product_id)

            # Add the product details to the pick list.
            pick_list << product

        rescue ActiveRecord::RecordNotFound
            # Handle the case where the product is not found.
            # Log the error or display a message to the user.
            # Add a placeholder entry to the pick list.
            pick_list << { id: product_id, name: "Product ID #{product_id} - Not Found" }
            #raise "Product ID #{product_id} not found in the database." #uncomment for testing
        rescue Exception => e
            #Handle other exceptions
            pick_list << {id: product_id, name: "Error retrieving product" }
            #raise e
        end
    end

    # Return the pick list.
    return pick_list
end