#!/bin/bash

mkdir -p download
mkdir -p tmp

#if [ ! -f download/new-brunswick-latest.osm.pbf ]; then
#    wget -O download/new-brunswick-latest.osm.pbf https://download.geofabrik.de/north-america/canada/new-brunswick-latest.osm.pbf
#fi
#if [ ! -f download/quebec-latest.osm.pbf ]; then
#    wget -O download/quebec-latest.osm.pbf https://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf
#fi

./download_extract_us.sh northeast
./download_extract_us.sh midwest
./download_extract_us.sh pacific
./download_extract_us.sh south
./download_extract_us.sh west
