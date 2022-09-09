#!/bin/bash

OUTPUT_FILE=static/map.js
sed -i "s#__GEOIP_LAT__#${GEOIP_LAT}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_LONG__#${GEOIP_LONG}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_MAPBOX_TOKEN__#${GEOIP_MAPBOX_TOKEN}#g" ${OUTPUT_FILE}

OUTPUT_FILE=index.html
sed -i "s#__GEOIP_LEGEND1__#${GEOIP_LEGEND1}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_LEGEND2__#${GEOIP_LEGEND2}#g" ${OUTPUT_FILE}
sed -i "s#__GEOIP_IMAGE_PATH__#${GEOIP_IMAGE_PATH}#g" ${OUTPUT_FILE}

python3 -u AttackMapServer.py
