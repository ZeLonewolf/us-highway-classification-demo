#!/bin/bash
./generate_render_file.sh
cp style/* ../openstreetmap-carto/style/
cp data.osm.pbf ../openstreetmap-carto/
