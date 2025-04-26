# prg3/ruby-on-rails-react/super_dating/backend/src/components/database_layer.rb

# This module handles interactions with the PostgreSQL database.
# It encapsulates database-related logic to maintain a clean and
# organized codebase.  It's named 'DatabaseLayer' to signify
# its role in managing database connections and queries.

module DatabaseLayer

  # Define a global variable to store the database connection.
  # This improves testability and allows for easy configuration.
  # @var ActiveRecord::Base
  # @private
  @@db = ActiveRecord::Base

  # Initialize the database connection.
  # This method is called when the DatabaseLayer module is first loaded.
  # It establishes a connection to the PostgreSQL database and configures
  # the database session.
  def self.initialize
    # Configure the database connection with the correct settings.
    # This includes the database name, username, password, and host.
    # Replace with your actual database credentials.
    @@db.connection.establish_connection({
      :host => 'localhost',
      :username => 'your_db_user',
      :password => 'your_db_password',
      :database => 'super_dating'
    })
  end


  # Perform a database query.
  # This method takes a SQL query as an argument and executes it against
  # the database. It returns an array of hash objects, where each hash
  # represents a row in the result set.
  # @param query string The SQL query to execute.
  # @return [Array<Hash>] An array of hash objects representing the results of the query.
  def self.execute_query(query)
    # Execute the query against the database.
    # Returns an array of hashes.
    @@db.connection.execute(query)
  end

  # Perform a single row query
  # @param query string The SQL query to execute.
  # @return [Hash] A single hash object representing the results of the query.
  def self.execute_single_query(query)
    # Execute the single row query against the database.
    # Returns a single hash object.
    @@db.connection.execute(query)
  end


  # Perform a database update.
  # This method takes a SQL update query as an argument and executes it against
  # the database. It returns the number of rows affected by the query.
  # @param query string The SQL update query to execute.
  # @return [Integer] The number of rows affected by the query.
  def self.update_data(query)
    # Executes the query against the database.
    # Returns the number of rows affected.
    @@db.connection.execute(query)
  end

  # Perform a database insert.
  # This method takes a SQL insert query as an argument and executes it against
  # the database. It returns the id of the newly inserted record.
  # @param query string The SQL insert query to execute.
  # @return [Integer] The id of the newly inserted record.
  def self.insert_data(query)
    # Execute the query against the database.
    # Returns the id of the newly inserted record.
    @@db.connection.execute(query)
  end

  # Perform a database delete.
  # This method takes a SQL delete query as an argument and executes it against
  # the database. It returns the number of rows affected by the query.
  # @param query string The SQL delete query to execute.
  # @return [Integer] The number of rows affected by the query.
  def self.delete_data(query)
    # Execute the query against the database.
    # Returns the number of rows affected.
    @@db.connection.execute(query)
  end

end