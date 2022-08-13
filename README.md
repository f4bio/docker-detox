# multi-arch container running detox

Minim enim sit sit elit sint officia elit anim. Pariatur qui aliquip id et pariatur ullamco fugiat mollit. Deserunt laboris nulla aliqua minim Lorem nisi sint et nostrud qui voluptate sit. Est do do eu incididunt. Nisi officia proident sint commodo labore amet consequat velit et eiusmod excepteur. Magna amet et duis laboris cillum. Aute consequat fugiat ut cupidatat elit ex nisi enim laboris consectetur ad.

## Requirements

* Docker needs to be installed on the machine that will run this environment
* Make sure that Docker have the correct rights on the directory you wish to work on

## Instruction

* Tempor nostrud sit duis duis consequat esse non quis exercitation qui ex culpa nulla.

### Build

Normal build:

```bash
docker build \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg APPLICATION_NAME=detox \
  --build-arg BUILD_VERSION=v1.0 \
  --file Dockerfile \
  --tag f4bio/detox:latest \
  --no-cache \
  .
```

Multiarch build:

```bash
docker buildx build \
  --platform linux/arm/v7,linux/arm64,linux/amd64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg APPLICATION_NAME=detox \
  --build-arg BUILD_VERSION=v1.0 \
  --file Dockerfile \
  --tag f4bio/detox:latest \
  --no-cache \
  --push \
  .
```

### Run

to detox all files in `$(pwd)/data` recursivly:

```bash
docker run --rm -v $(pwd)/data:/data f4bio/detox
```

## Additional Resources / Information

* [http://detox.sourceforge.net/](http://detox.sourceforge.net/)
