#!/bin/sh

VENDOR='Andrew Ayer <agwa@andrewayer.name>'
MAINTAINER='Shaun Martin <shaun@samsite.ca>'
URL='https://github.com/AGWA/git-crypt'
SUMMARY='transparent file encryption in git'
DESCRIPTION="""git-crypt enables transparent encryption and decryption of files in a git repository. Files which you choose to protect are encrypted when committed, and decrypted when checked out. git-crypt lets you freely share a repository containing a mix of public and private content. git-crypt gracefully degrades, so developers without the secret key can still clone and commit to a repository with encrypted files. This lets you store your secret material (such as keys or passwords) in the same repository as your code, without requiring you to lock down your entire repository.

git-crypt was written by Andrew Ayer (agwa@andrewayer.name). For more information, see https://www.agwa.name/projects/git-crypt."""

# append date to version if the master branch is used
[ "$VERSION" == "master" ] && FPM_VERSION="${VERSION}.`date +%Y%m%d_%H%M%S`" || FPM_VERSION=$VERSION

# fetch
git clone --branch $VERSION --single-branch \
  https://github.com/AGWA/git-crypt.git /tmp/git-crypt || exit 1


# build
cd /tmp/git-crypt
make || exit 1
mkdir /tmp/dist || exit 1
make install PREFIX=/tmp/dist || exit 1

# package
echo "FPM Options:"
echo "  -s dir "
echo "  --force "
echo "  --chdir /tmp/dist "
echo "  --output-type rpm "
echo "  --name git-crypt "
echo "  --version $FPM_VERSION "
echo "  --prefix /usr "
echo "  --package $WORKDIR "
echo "  --depends git "
echo "  --license GPLv3 "
echo "  --vendor \"$VENDOR\" "
echo "  --maintainer \"$MAINTAINER\" "
echo "  --url $URL "
echo "  --description \"$DESCRIPTION\" "
echo "  --rpm-summary \"$SUMMARY\""

fpm -s dir \
  --force \
  --chdir /tmp/dist \
  --output-type rpm \
  --name git-crypt \
  --version $FPM_VERSION \
  --prefix /usr \
  --package $WORKDIR \
  --depends git \
  --license GPLv3 \
  --vendor "$VENDOR" \
  --maintainer "$MAINTAINER" \
  --url $URL \
  --description "$DESCRIPTION" \
  --rpm-summary "$SUMMARY" \
  . || exit 1
