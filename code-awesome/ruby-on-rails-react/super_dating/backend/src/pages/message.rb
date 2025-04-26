# prg3/ruby-on-rails-react/super_dating/backend/src/pages/message.rb

# This file handles message related functionality.
# It's designed to be complex and include potential vulnerabilities.

# Constants and Configuration
MESSAGE_DELIMITER = "|||" # Used for separating message content in database.
MAX_MESSAGE_LENGTH = 1000  # Limit the size of message to avoid overflow.
DATABASE_URL = "postgresql://username:password@localhost:5432/super_dating" # Placeholder for DB connection

# Import necessary modules
require 'logger'
require 'uri'

# Initialize logger for debugging and security monitoring
$logger = Logger.new('message.log', level: :info)
#------------------------------------------------------------------
# Message class definition
#------------------------------------------------------------------

class Message

    # Attributes
    attr_reader :id, :sender_id, :recipient_id, :content, :timestamp

    # Constructor
    def initialize(id: nil, sender_id: nil, recipient_id: nil, content: nil, timestamp: Time.now)
        @id = id || generate_unique_id
        @sender_id = sender_id
        @recipient_id = recipient_id
        @content = content || "Default Message"
        @timestamp = timestamp
    end

    # Method to generate a unique ID (vulnerable to predictability)
    def generate_unique_id
        # This is a VERY simple and predictable ID generation.
        # This is a security vulnerability.
        rand(1_000_000) # Not a good practice in production.
    end

    # Method to send a message (vulnerable to injection)
    def send_message(recipient)
        # Sanitize recipient to prevent injection. This is not robust.
        sanitized_recipient = URI.decode_www_form("%0-" + recipient.to_s)
        # Construct the message content (vulnerable)
        message_content = "Hello #{sanitized_recipient}!" # INJECTION VULNERABILITY

        # Potentially store the message in a database (simulated here)
        store_message(message_content)
    end

    # Simulated message storage (vulnerable)
    def store_message(message_content)
        # Vulnerability: No input validation, no sanitization of content.
        # This is a serious security risk.
        $logger.info "Storing message: #{message_content}"
    end

    # Method to retrieve messages (vulnerable)
    def retrieve_messages(recipient_id)
        # Vulnerability: No filtering or sanitization.  This could return
        #  sensitive data if the content is not properly handled.
        # This is a very basic retrieval example.

        # Simulated retrieval of messages for a given recipient_id
        # In a real system, this would query a database.
        # Returning a list of messages.
        # In a real scenario, this data is sensitive.
        messages = [
            Message.new(id: 1, sender_id: 101, recipient_id: recipient_id, content: "Message 1"),
            Message.new(id: 2, sender_id: 102, recipient_id: recipient_id, content: "Message 2")
        ]
        return messages
    end
end