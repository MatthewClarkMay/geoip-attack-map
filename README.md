### First and Foremost
I do not have much time in my life right now to maintain this project. I undertook this challenge as a means to learn JavaScript, and to improve upon the Python I already knew. I'm sure there are several things I could have done differently in my implementation, and I won't be offended if I receive constructive criticism from someone who downloads and views my code. I know I learned a ton when working on this, and I hope the open source community will continue to teach me things :)

### Cyber Security GeoIP Attack Map Visualization
This geoip attack map visualizer was developed to display network attacks on your organization in real time. The data server follows a syslog file, and parses out source IP, destination IP, source port, and destination port. Protocols are determined via common ports, and the visualizations vary in color based on protocol type. [CLICK HERE](https://www.youtube.com/watch?v=raNp9uA7fvc) for a demo video. This project would not be possible if it weren't for Sam Cappella, who created a cyber defense competition network traffic visualizer for the 2015 Palmetto Cyber Defense Competition. I mainly used his code as a reference, but I did borrow a few functions while creating the display server, and visual aspects of the webapp. I would also like to give special thanks to [Dylan Madisetti](http://www.dylanmadisetti.com/) as well for giving me advice about certain aspects of my implementation.

### Important
This program relies entirely on syslog, and because all appliances format logs differently, you will need to customize the log parsing function(s). If your organization uses a security information and event management system (SIEM), it can probably normalize logs to save you a ton of time writing regex.
1. Send all syslog to SIEM.
2. Use SIEM to normalize logs.
3. Send normalized logs to the box (any Linux machine running syslog-ng will work) running this software so the data server can parse them.

### Configs 
1. Make sure in **/etc/redis/redis.conf** to change **bind 127.0.0.1** to **bind 0.0.0.0** if you plan on running the DataServer on a different machine than the AttackMapServer.
2. Make sure that the WebSocket address in **/AttackMapServer/index.html** points back to the IP address of the **AttackMapServer** so the browser knows the address of the WebSocket.
3. Download the MaxMind GeoLite2 database, and change the db_path variable in **DataServer.py** to the wherever you store the database.
    * ./db-dl.sh
4. Add headquarters latitude/longitude to hqLatLng variable in **index.html**
5. Use syslog-gen.py, or syslog-gen.sh to simulate dummy traffic "out of the box."
6. **IMPORTANT: Remember, this code will only run correctly in a production environment after personalizing the parsing functions. The default parsing function is only written to parse ./syslog-gen.sh traffic.**

### Bugs, Feedback, and Questions
If you find any errors or bugs, please let me know. Questions and feedback are also welcome, and can be sent to mcmay.web@gmail.com, or open an issue in this repository.


### Deploy example
Tested on Ubuntu 16.04 LTS.

* Install system dependencies:

  ```sh
  sudo apt install python3-pip redis-server
  sudo apt-get install python3-pip redis-server
  ```
* Clone the application:

  ```sh
  git clone https://github.com/nullelement/geoip-attack-map.git
  ```

* Install python requirements:

  ```sh
  cd geoip-attack-map
  sudo pip3 install -U -r requirements.txt
  ```
  
* Start Redis Server:

  ```sh
  redis-server

  ```
* Configure the Data Server DB:
  
  ```sh
  cd DataServerDB
  ./db-dl.sh
  cd ..
  ```
* Start the Data Server:

  ```sh
  cd DataServer
  sudo python3 DataServer.py
  ```
  
* Start the Syslog Gen Script, inside DataServer directory:

  * Open a new terminal tab (Ctrl+Shift+T, on Ubuntu).
  
    ```sh
    python3 syslog-gen.py
    ./syslog-gen.sh
    ```

* Configure the Attack Map Server, extract the flags to the right place:

  * Open a new terminal tab (Ctrl+Shift+T, on Ubuntu).
  
    ```sh
    cd ..
    cd AttackMapServer/
    unzip static/flags-mini.zip -d static/flags
    ``` 
 
* Start the Attack Map Server:
  
    ```sh
    sudo python3 AttackMapServer.py
    ```
 
* Access the Attack Map Server from browser:

    * [http://localhost:8888/](http://localhost:8888/) or [http://127.0.0.1:8888/](http://127.0.0.1:8888/)
  
    * To access by a browser in another computer, use the external IP of the machine running the AttackMapServer.
    
     * Edite the IP Address in the file "index.html" at "AttackMapServer" directory. From:
      
       ```javascript
       var webSock = new WebSocket("ws:/127.0.0.1:8888/websocket");
       ```
     * To, for example: 
     
       ```javascript
       var webSock = new WebSocket("ws:/192.168.1.100:8888/websocket");
       ```        
     * To, for example: 
     
       ```javascript
       var webSock = new WebSocket("ws:/192.168.11.106:8888/websocket");
       ```
     * Restart the Attack Map Server:
     
       ```sh
       sudo python3 AttackMapServer.py
       ```
     * On the other computer, points the browser to:
     
       ```sh
       http://192.168.1.100:8888/
       ```       
     * On the other computer, points the browser to:
     
       ```sh
       http://192.168.11.106:8888/
       ```
