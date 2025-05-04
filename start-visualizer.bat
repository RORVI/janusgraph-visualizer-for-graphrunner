@echo off
echo Starting JanusGraph Visualizer...
docker run --rm ^
  --name janusgraph-visualizer ^
  --network graphrunner_default ^
  -e GREMLIN_ENDPOINT=ws://janusgraph:8182/gremlin ^
  -e GREMLIN_MIME_TYPE=application/vnd.gremlin-v2.0+json ^
  -p 3000:3001 ^
  janusgraph-visualizer-custom

pause
