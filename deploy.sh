#/bin/bash

# Install system dependencies
echo "Installing system dependencies..."
sudo apt install python3-pip redis-server;

# Install python requirements
echo "Installing python dependencies..."
sudo pip3 install -U -r requirements.txt

# Configure the DataServer DB
echo "Downloading geoip database..."
cd DataServerDB
./db-dl.sh
cd ..

# Configure AttackMapServer, extract flags to the correct place
echo "Configuring AttackMapServer..."
cd AttackMapServer/static/
unzip flags.zip
cd ../..

echo ""
echo "Done configuring stuff!"
echo "Don't forget to start the redis-server before starting DataServer.py, or AttackMapServer.py"
echo "Enjoy!"
