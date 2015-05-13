#!/bin/bash
curl 'http://localhost:8983/solr/bbiw/update?stream.body=<delete><query>*:*</query></delete>&commit=true'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/crime_clean.json -H 'Content-type:application/json'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/defense_clean.json -H 'Content-type:application/json'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/energy_clean.json -H 'Content-type:application/json'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/environment_clean.json -H 'Content-type:application/json'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/health_clean.json -H 'Content-type:application/json'
curl 'http://localhost:8983/solr/bbiw/update?commit=true' --data-binary @clean/transport_clean.json -H 'Content-type:application/json'
