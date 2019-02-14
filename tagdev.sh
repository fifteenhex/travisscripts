#!/bin/sh

if [ $# -ne 3 ]; then
	exit 1
fi

SSHKEY=$1
KEY=$2
IV=$3

openssl aes-256-cbc -K $KEY \
	-iv $IV \
	-in $SSKEY -out ~/.ssh/id_rsa -d
chmod 0400 ~/.ssh/id_rsa
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
git tag -d dev
git tag dev -a -m "build $TRAVIS_BUILD_NUMBER"
git remote add ffs `git remote get-url origin | sed -e s#https://#git@# -e s#github.com/#github.com:#`
git push --force ffs dev
