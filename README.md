# JanusGraph-Visualizer for GraphRunner
This project visualizes graph data queried from a JanusGraph backend via Gremlin. This fork is fully Docker-integrated and customized to support [GraphRunner](https://github.com/RORVI/GraphRunner), including robust container communication, environment configuration, and simplified deployment.

![Visualizer Screenshot](https://raw.githubusercontent.com/JanusGraph/janusgraph-visualizer/refs/heads/main/assets/JanusGraph-Visualizer.png)

---

## 🚀 Quick Start (GraphRunner Integration)

1. Make sure the GraphRunner stack is up and running (`janusgraph` should be running on Docker network `graphrunner_default`).
2. Run the visualizer with Docker using the script:

```bash
./start-visualizer.sh
```

Or, on Windows:
```bat
start-visualizer.bat
```

3. Open your browser and go to:
```sh
http://localhost:3000
```
4. Run a basic query such as:
```gremlin
g.V().limit(5)
```
5. 🎉 Enjoy your live JanusGraph visualizer.

---

## 🐳 Docker Build

To build the visualizer locally:

```bash
docker build -t janusgraph-visualizer-custom -f full.Dockerfile .
```

To run manually:
```bash
docker run --rm \
  --name janusgraph-visualizer \
  --network graphrunner_default \
  -e GREMLIN_ENDPOINT=ws://janusgraph:8182/gremlin \
  -e GREMLIN_MIME_TYPE=application/vnd.gremlin-v2.0+json \
  -p 3000:3001 \
  janusgraph-visualizer-custom
```

---

## 🌐 Environment Variables

- `GREMLIN_ENDPOINT`: Full WebSocket URL to the Gremlin server (e.g., `ws://janusgraph:8182/gremlin`)
- `GREMLIN_TRAVERSAL_SOURCE`: Default traversal source (default: `g`)
- `GREMLIN_DEFAULT_QUERY`: Default query to show on load (default: `g.V()`)

These are injected at runtime and respected by both frontend and backend components.

---

## ⚙️ Features
- Works seamlessly inside Docker and on custom Docker networks
- Accepts configuration via environment variables
- Integrates with GraphRunner’s JanusGraph backend without conflicts
- Optional React frontend served statically by the Node proxy
- Custom queries and traversal source support

---

## 📂 Project Structure Changes
- `full.Dockerfile`: Custom production-ready Dockerfile
- `proxy-server.js`: Now uses `GREMLIN_ENDPOINT` directly from env
- Frontend talks to `/settings` for dynamic endpoint info

---

## Credits & Origin
Based on the original [Gremlin-Visualizer](https://github.com/prabushitha/gremlin-visualizer) by [Umesh Jayasinghe](https://github.com/prabushitha).

---

## 🤝 Contributions Welcome
PRs, improvements, and ideas are encouraged. File issues or send a PR if you want to help polish the visualizer further for the JanusGraph + GraphRunner ecosystem.
