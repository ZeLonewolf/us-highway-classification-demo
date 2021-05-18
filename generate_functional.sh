#!/bin/bash

./download.sh

#osmium tags-filter -O -o tmp/highways-ne.pbf download/us-northeast-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-s.pbf download/us-south-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-w.pbf download/us-west-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-mw.pbf download/us-midwest-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o tmp/highways-pac.pbf download/us-pacific-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link

#osmium merge -O -o functional_highways-ne.osm.pbf tmp/highways-ne.pbf
osmium merge -O -o functional_highways-s.pbf tmp/highways-s.pbf
osmium merge -O -o functional_highways-mw.pbf tmp/highways-mw.pbf
osmium merge -O -o functional_highways-w.pbf tmp/highways-w.pbf
osmium merge -O -o functional_highways-pac.pbf tmp/highways-pac.pbf
