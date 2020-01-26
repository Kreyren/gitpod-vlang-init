FROM gitpod/workspace-full-vnc:latest

## VLANG ##
# WTF: LABEL dazzle/layer=tool-brew
# WTF: LABEL dazzle/test=tests/tool-brew.y
USER root
# Simplified die wrapper
RUN die() { printf 'FATAL: %s\n' "$2" ; exit "$1" ;} ; 
#RUN [ ! -d "/usr/" ] && { mkdir /usr || die 1 "Unable to make a new directory in /usr" ;}
#RUN [ ! -d "/usr/src" ] && { mkdir /usr/src || die 1 "Unable to make a new directory in /usr/src" ;}
RUN die() { printf 'FATAL: %s\n' "$2" ; exit "$1" ;} ; [ ! -d "/tmp/vlang" ] && { git clone https://github.com/vlang/v /tmp/vlang || die 1 "Unable to clone vlang in /usr/src/vlang" ;}
RUN if ! command -v v >/dev/null; then { make -C /usr/src/vlang || die 1 "Unable to compile vlang for deploy" ;}; fi
# Selfcheck
RUN if ! command -v v >/dev/null; then die 256 "Failed to install vlang on target system"; fi