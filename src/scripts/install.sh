#!/bin/sh

id=$(id -u)
if [ "${id}" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi

if dpkg --help >/dev/null ; then
    export EXT=".deb"
    $SUDO apt update
    $SUDO apt install curl jq -y
elif apk list >/dev/null ; then
    export EXT=".apk"
    $SUDO apk add jq curl
elif rpm --help >/dev/null ; then
    export EXT=".rpm"
    $SUDO yum update
    $SUDO yum install curl jq -y
fi

curl -sSfL https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | sh
export PATH=$PATH:/root/.scribe/bin
