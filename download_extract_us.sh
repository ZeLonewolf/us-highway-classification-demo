#!/bin/bash

mkdir -p download
mkdir -p tmp

if [ ! -f "download/us-$1-latest.osm.pbf" ]; then
    wget -O "download/us-$1-latest.osm.pbf" "https://download.geofabrik.de/north-america/us-$1-latest.osm.pbf"
fi
