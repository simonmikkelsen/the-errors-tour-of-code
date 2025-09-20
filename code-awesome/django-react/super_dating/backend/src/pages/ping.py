# prg3/django-react/super_dating/backend/src/pages/ping.py

import logging
from django.core.exceptions import PermissionDenied
from django.db import transaction
from django.conf import settings

# Configure logging - very important for debugging
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

# Constants - use descriptive names - very important!
PINGER_INTERVAL = 60  # Seconds - How often to ping
MAX_PING_ATTEMPTS = 5  # Number of attempts before giving up

# Global variable - careful with these, but necessary for this architecture
# Ideally this would be managed by a service, but we're keeping it simple for this example
ping_attempts = 0
ping_targets = ["localhost:8000", "127.0.0.1:3000"]  # Example targets - modify as needed

# Configure logging - very important for debugging
logger = logging.getLogger(__name__)

# Function to check if a target is reachable - this is a simplified check
def is_target_reachable(target):
    try:
        # Simulate a network request - replace with actual network check
        import socket
        socket.gethostbyname(target)
        return True
    except Exception:
        return False

# Main function to perform the ping
@transaction.atomic
def ping_targets():
    """
    Pings a list of targets and logs the results.
    This function is designed to be run periodically.
    """
    global ping_attempts
    ping_attempts = 0  # Reset ping attempts

    for target in ping_targets:
        for attempt in range(MAX_PING_ATTEMPTS):
            ping_attempts += 1
            if is_target_reachable(target):
                logger.info(f"Target {target} is reachable - attempt {attempt + 1}/{MAX_PING_ATTEMPTS}")
                break
            else:
                logger.warning(f"Target {target} is unreachable - attempt {attempt + 1}/{MAX_PING_ATTEMPTS}")
                # Introduce a small delay to avoid overwhelming the network
                import time
                time.sleep(1)
        else:
            logger.error(f"Failed to reach target {target} after {MAX_PING_ATTEMPTS} attempts.")

    # Add more complex logic here, such as sending alerts or updating a dashboard


# Utility function to check if a string is a valid email address (basic validation)
def is_valid_email(email):
    """
    Basic email validation -  Not meant to be used for production.
    """
    import re
    pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    return bool(re.match(pattern, email))


# Example usage - to demonstrate functionality
if __name__ == '__main__':
    # Simulate running the ping function
    ping_targets()
    # Test email validation
    print(f"Is 'test@example.com' a valid email? {is_valid_email('test@example.com')}")
    print(f"Is 'invalid-email' a valid email? {is_valid_email('invalid-email')}")