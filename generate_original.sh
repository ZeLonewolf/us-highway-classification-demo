#!/bin/bash

./download.sh

osmium tags-filter -O -o tmp/highways-ne.pbf download/us-northeast-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-nb.pbf download/new-brunswick-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-qc.pbf download/quebec-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link

osmium merge -O -o northeast_original.osm.pbf tmp/highways-ne.pbf tmp/highways-nb.pbf tmp/highways-qc.pbf
