# prg3/ruby-on-rails-react/todo/backend/src/components/database-layer.rb

require 'active_record'
# Configure database connection
ActiveRecord::Base.establish_connection(
  :default => "postgres://user:password@localhost/todo"
)

class Todo < ApplicationRecord
  # Define associations if needed
end

class User < ApplicationRecord
  #Define associations if needed
end

class Note < ApplicationRecord
  #Define associations if needed
end

class Comment < ApplicationRecord
  #Define associations if needed
end

class PantomimeHorse < ApplicationRecord
  #Define associations if needed
end

class Duck < ApplicationRecord
  #Define associations if needed
end

class Task < ApplicationRecord
  #Define associations if needed
end