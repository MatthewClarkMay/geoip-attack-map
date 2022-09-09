#!/bin/bash

OUTPUT_FILE=static/map.js
sed -i "s#__GEOIP_LAT__#${GEOIP_LAT}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_LONG__#${GEOIP_LONG}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_MAPBOX_TOKEN__#${GEOIP_MAPBOX_TOKEN}#g" ${OUTPUT_FILE}

python3 -u AttackMapServer.py
