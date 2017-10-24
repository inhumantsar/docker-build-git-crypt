# build-git-crypt

Docker image which builds git-crypt and spits out an RPM.

## Usage

Two ENV vars configure everything:
* `VERSION`: Use git tags (eg: '0.5.0') or branch names here. Default: `master`
* `WORKDIR`: Dir to output RPM to. Default: `/workspace`

```
docker run --rm -it \
    [-e VERSION=master] \
    [-e WORKDIR=/workspace -w /workspace] \
    -v $(pwd):/workspace \
    inhumantsar/build-git-crypt
```
