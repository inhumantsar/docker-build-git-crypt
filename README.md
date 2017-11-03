# build-git-crypt

Docker image which builds git-crypt and spits out an RPM.

## Tags

* `latest`, `centos` - Produces an RPM with/for CentOS 7.
* `ubuntu` - Produces a DEB with Ubuntu Xenial targeting Xenial-Artful.
* Broken currently: ~~`win-mingw` - Produces an EXE for Windows (64-bit) w/ MinGW (x86_64).~~

## Usage

Run with `-e VERSION='x.x.x'` to build a specific version.

```
docker run --rm -it \
    -v $(pwd):/workspace \
    inhumantsar/build-git-crypt
```
