#!/bin/bash

./download.sh

echo "Generating boundaries"

osmium tags-filter -O -o tmp/boundary-ne.pbf download/us-northeast-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-mw.pbf download/us-midwest-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-s.pbf download/us-south-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-w.pbf download/us-west-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-pac.pbf download/us-pacific-latest.osm.pbf r/boundary=administrative

osmium tags-filter -O -o tmp/boundary4-ne.pbf tmp/boundary-ne.pbf r/admin_level=2,4
osmium tags-filter -O -o tmp/boundary4-mw.pbf tmp/boundary-mw.pbf r/admin_level=2,4
osmium tags-filter -O -o tmp/boundary4-s.pbf tmp/boundary-s.pbf r/admin_level=2,4
osmium tags-filter -O -o tmp/boundary4-w.pbf tmp/boundary-w.pbf r/admin_level=2,4
osmium tags-filter -O -o tmp/boundary4-pac.pbf tmp/boundary-pac.pbf r/admin_level=2,4

echo "Generating places"

osmium tags-filter -O -o tmp/place-ne.pbf download/us-northeast-latest.osm.pbf n/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-mw.pbf download/us-midwest-latest.osm.pbf n/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-s.pbf download/us-south-latest.osm.pbf n/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-w.pbf download/us-west-latest.osm.pbf n/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-pac.pbf download/us-pacific-latest.osm.pbf n/place=city,town,village,suburb

echo "Generating roads"

osmium tags-filter -O -o original_highways-ne.pbf download/us-northeast-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o original_highways-mw.pbf download/us-midwest-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o original_highways-s.pbf download/us-south-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o original_highways-w.pbf download/us-west-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link
osmium tags-filter -O -o original_highways-pac.pbf download/us-pacific-latest.osm.pbf w/highway=motorway,trunk,primary,motorway_link,trunk_link,primary_link

echo "Merging data file"

osmium merge -O -o data.osm.pbf \
	functional_highways-ne.pbf \
	functional_highways-mw.pbf \
	functional_highways-w.pbf \
	functional_highways-s.pbf \
	functional_highways-pac.pbf \
	tmp/boundary4-ne.pbf \
	tmp/boundary4-mw.pbf \
	tmp/boundary4-s.pbf \
	tmp/boundary4-w.pbf \
	tmp/boundary4-pac.pbf \
	tmp/place-ne.pbf \
	tmp/place-mw.pbf \
	tmp/place-s.pbf \
	tmp/place-w.pbf \
	tmp/place-pac.pbf

echo "Generated data.osm.pbf"
