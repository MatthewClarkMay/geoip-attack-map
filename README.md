### Cyber Security GeoIP Attack Map Visualization
This geoip attack map visualizer was developed to display network attacks on your organization in real time. The data server follows a syslog file, and parses out source IP, destination IP, source port, and destination port. Protocols are determined via common ports, and the visualizations vary in color based on protocol type. [CLICK HERE](https://www.youtube.com/watch?v=raNp9uA7fvc) for a demo video. This project would not be possible if it weren't for Sam Cappella, who created a cyber defense competition network traffic visualizer for the 2015 Palmetto Cyber Defense Competition. I mainly used his code as a reference, but I did borrow a few functions while creating the display server, and visual aspects of the webapp. I would also like to give special thanks to [Dylan Madisetti](http://www.dylanmadisetti.com/) as well for giving me advice about certain aspects of my implementation. I will soon be adding a legend/dashboard to the app which will feature scrolling IP addresses, country flags, cities, protocols, stats, and much more.

### Important
This program relies entirely on syslog, and because all appliances format logs differently, you will need to customize the log parsing function(s). If your organization uses a security information and event management system (SIEM), it can probably normalize logs to save you a ton of time writing regex.
1. Send all syslog to SIEM.
2. Use SIEM to normalize logs.
3. Send normalized logs to the box (any Linux machine running syslog-ng will work) running this software so the data server can parse them.

### Installation
Run the following commands to install all required dependencies (tested on Ubuntu 14.04 x64)
```
# sudo apt-get install python3-pip redis-server
# sudo pip3 install tornado tornado-redis redis maxminddb
```

### Setup
1. Make sure in **/etc/redis/redis.conf** to change **bind 127.0.0.1** to **bind 0.0.0.0** if you plan on running the DataServer on a different machine than the AttackMapServer.
2. Make sure that the WebSocket address in **/AttackMapServer/index.html** points back to the IP address of the **AttackMapServer** so the browser knows the address of the WebSocket.
3. Download the MaxMind GeoLite2 database, and change the db_path variable in **DataServer.py** to the wherever you store the database.
    * ./db-dl.sh
4. Add headquarters latitude/longitude to hqLatLng variable in **index.html**
5. Use syslog-gen.sh to simulate dummy traffic "out of the box."
6. **IMPORTANT: Remember, this code will only run correctly in a production environment after personalizing the parsing functions. The default parsing function is only written to parse ./syslog-gen.sh traffic.**

### Bugs, Feedback, and Questions
If you find any errors or bugs, please let me know. Questions and feedback are also welcome, and can be sent to mcmay.web@gmail.com, or open an issue in this repository.

### Final Words
As mentioned, I will be adding a legend/dashboard to the map shortly. I wanted to quickly get the code on here for people to see, because I wouldn't have the knowledge I do today without other open source software to study, and I want to give back to the community. Hope you enjoy!
