#!/bin/bash

mkdir -p download
mkdir -p tmp

if [ ! -f download/new-brunswick-latest.osm.pbf ]; then
    wget -O download/new-brunswick-latest.osm.pbf https://download.geofabrik.de/north-america/canada/new-brunswick-latest.osm.pbf
fi
if [ ! -f download/quebec-latest.osm.pbf ]; then
    wget -O download/quebec-latest.osm.pbf https://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf
fi
if [ ! -f download/us-northeast-latest.osm.pbf ]; then
    wget -O download/us-northeast-latest.osm.pbf https://download.geofabrik.de/north-america/us-northeast-latest.osm.pbf
fi

osmium tags-filter -O -o tmp/highways-ne.pbf download/us-northeast-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-nb.pbf download/new-brunswick-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-qc.pbf download/quebec-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link

osmium merge -O -o northeast_original.osm.pbf tmp/highways-ne.pbf tmp/highways-nb.pbf tmp/highways-qc.pbf