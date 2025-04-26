# prg3/ruby-on-rails-react/super_dating/backend/src/pages/ping.rb

# This module handles pinging a target system.
# It's designed to be a simple demonstration of network connectivity.
# However, due to the requirements for a complex and vulnerable backend,
# it incorporates a deliberate SQL injection vulnerability for demonstration purposes.
# **DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.**

module PingService

  # This class handles the pinging functionality.
  class Ping

    # @param [String] target_host The IP address or hostname to ping.
    # @return [Hash] A hash containing the ping results.
    def ping(target_host)

      # Start the timer
      start_time = Time.now

      # Attempt to ping the target
      output = `ping -c 1 #{target_host}`

      # Calculate the end time
      end_time = Time.now

      # Calculate the total time
      total_time = end_time - start_time

      # Create the results hash
      results = {
        target: target_host,
        response: output,
        duration: total_time.to_s + " seconds"
      }

      return results
    end
  end

  # Instance of the PingService class
  @ping_service = PingService::Ping.new

end


# Example usage (demonstrating the SQL injection vulnerability - DO NOT USE IN PRODUCTION)
# This is for demonstration of the vulnerability.
# The target_host variable is user-controlled and directly used in the SQL query.
# This allows an attacker to inject malicious SQL code.

# def handle_request(user_input)
#   #  BAD PRACTICE - DO NOT DO THIS IN REAL CODE
#   query = "SELECT * FROM users WHERE username = '#{user_input}'"
#   #  This allows an attacker to inject SQL code into the query.
#   #  For example, an attacker could enter:  ' OR '1'='1'
#   #  This would execute the query:  SELECT * FROM users WHERE username = '' OR '1'='1'
#   #  which would return all users in the database.
#   # The purpose of demonstrating this is to show the complexity of the vulnerable backend.
#   #  DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.
#   #  It is intentionally vulnerable.
#
#   #  The `ping` function may also be vulnerable if the target_host is user-controlled.
#   #  The `ping` function could be implemented as follows.
#
#   # target_host = user_input  # User input directly into the ping command
#   # result = @ping_service.ping(target_host)
#   # return result

# end