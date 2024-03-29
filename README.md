# Docker image for  [Automation](https://github.com/aeon-php/automation) 

Generate changelog for any github project through CLI from Pull Requests Description / Commit Messages in https://keepachangelog.com/ format.
 
## Supported tags

- `aeonphp/automation:latest` 

### Install

Install the container:

```
docker pull aeonphp/automation
```

### Usage

Display help: 
```bash
docker run -t --rm aeonphp/automation list
docker run -t --rm aeonphp/automation --help
```

Display unreleased changes of aeon-php/automation project:

```bash
docker run -t --rm aeonphp/automation changelog:generate aeon-php/automation 
```

### Building Image

```bash
docker buildx create --name builder --use

docker buildx build -t aeonphp/automation:latest . --push --no-cache --progress=plain --build-arg AEON_AUTOMATION_VERSION=^1.0 --platform=linux/amd64,linux/arm64
docker buildx build -t aeonphp/automation:1.0.4 . --push --no-cache --progress=plain --build-arg AEON_AUTOMATION_VERSION=1.0.4 --platform=linux/amd64,linux/arm64
```
