#!/bin/sh
set -x

is_command() {
  command -v "$1" >/dev/null
}


id=$(id -u)
if [ "${id}" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi

if is_command wget; then
    wget -O /dev/stdout  https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | $SUDO ENV=$ENV sh -s -- -b /usr/local/bin -d
    exit 0
elif is_command curl; then
    curl -sSfL https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | $SUDO ENV=$ENV sh -s -- -b /usr/local/bin -d 
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

    curl -sSfL https://raw.githubusercontent.com/scribe-security/misc/master/install.sh | $SUDO ENV=$ENV sh -s -- -b /usr/local/bin
fi
 
# # Exit if version is already installed
# if command -v secrethub >/dev/null 2>&1 && secrethub --version 2>&1 | cut -d "," -f 1 | grep -q "$(echo $VERSION | cut -c 2-)$"; then
#   echo -e "${OK_COLOR}==> Version ${VERSION} is already installed${NO_COLOR}"
#   exit 0
# fi
