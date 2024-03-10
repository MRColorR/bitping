#!/usr/bin/env bash
#Author: MRColorR

# Load BITPING_EMAIL and BITPING_PASSWD from environment variables
# BITPING_EMAIL and BITPING_PASSWD are set in the Dockerfile
# BITPING_EMAIL and BITPING_PASSWD are set in the docker-compose.yml file
# BITPING_EMAIL and BITPING_PASSWD are set in the .env file

# Function to perform Bitping auto login
performLogin() {
    expect -c "
    spawn bitpingd login
    expect \"Email:\"
    sleep [expr {rand()*3}]
    send \"$BITPING_EMAIL\r\"
    expect \"Password:\"
    sleep [expr {rand()*3}]
    send \"$BITPING_PASSWD\r\"
    expect eof
    "

    # Check login status
    local LOGIN_STATUS=$?
    if [ $LOGIN_STATUS -ne 0 ]; then
      echo "Auto Login failed"
      exit 1
    fi
}

# Check if Bitping NODE_DB_PATH is set in the environment if not tell it and use the default
if [ -z "$NODE_DB_PATH" ]; then
  echo "NODE_DB_PATH is not set. Using default path"
  NODE_DB_PATH="/root/.bitping/node.db"
fi

# Check if BITPING_EMAIL and BITPING_PASSWD have been passed in
if [ -z "$BITPING_EMAIL" ] || [ -z "$BITPING_PASSWD" ]; then
  echo "BITPING_EMAIL and BITPING_PASSWD must be set as environment variables"
  exit 1
fi

# Check if the user is already logged in by examining if the node.db exists and if the email is in the node.db
if [ -f "$NODE_DB_PATH" ]; then
    # Check if email is already in the node.db
    if grep -q "$BITPING_EMAIL" "$NODE_DB_PATH"; then
        echo "User already logged in with $BITPING_EMAIL"
    else
        # Perform login
        echo "User not logged in with $BITPING_EMAIL but $NODE_DB_PATH exists. Performing login as $BITPING_EMAIL"
        performLogin
        echo "Login function completed"
    fi
else
    echo "$NODE_DB_PATH does not exist. Creating $NODE_DB_PATH by performing a fresh login as $BITPING_EMAIL"
    performLogin
    echo "Login function completed"
fi

## Change the refresh interval to 1 minute to reduce logging
bitpingd config refresh-interval 60sec

# Start Supervisor
mkdir -p /var/log/supervisor/children
exec supervisord -c /etc/supervisord.conf
