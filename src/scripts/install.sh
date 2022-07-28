#!/bin/sh
set -x

is_command() {
  command -v "$1" >/dev/null
}

id=$(id -u)
if [ "${id}" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi

if is_command wget; then
    $SUDO wget -O /dev/stdout  https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | sh -s -- -b /usr/local/bin
    exit 0
elif is_command curl; then
    $SUDO curl -sSfL https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | sh -s -- -b /usr/local/bin
else 
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

    $SUDO curl -sSfL https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | sh -s -- -b /usr/local/bin
fi



# 2DO use a more basic and common tool instead of curl.
