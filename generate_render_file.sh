#!/bin/bash

./download.sh

osmium tags-filter -O -o tmp/boundary-ne.pbf download/us-northeast-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-nb.pbf download/new-brunswick-latest.osm.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary-qc.pbf download/quebec-latest.osm.pbf r/boundary=administrative
	
osmium tags-filter -O -o tmp/boundary4-ne.pbf tmp/boundary-ne.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary4-nb.pbf tmp/boundary-nb.pbf r/boundary=administrative
osmium tags-filter -O -o tmp/boundary4-qc.pbf tmp/boundary-qc.pbf r/boundary=administrative

osmium tags-filter -O -o tmp/place-ne.pbf download/us-northeast-latest.osm.pbf n/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-nb.pbf download/new-brunswick-latest.osm.pbf r/place=city,town,village,suburb
osmium tags-filter -O -o tmp/place-qc.pbf download/quebec-latest.osm.pbf r/place=city,town,village,suburb

osmium merge -O -o data.osm.pbf northeast_functional.osm.pbf \
	tmp/boundary-ne.pbf \
	tmp/boundary-nb.pbf \
	tmp/boundary-qc.pbf \
	tmp/place-ne.pbf \
	tmp/place-nb.pbf \
	tmp/place-qc.pbf

echo "Generated data.osm.pbf"
