FROM gitpod/workspace-full-vnc:latest

## VLANG ##
# WTF: LABEL dazzle/layer=tool-brew
# WTF: LABEL dazzle/test=tests/tool-brew.y
USER root
ENV VLANG_SOURCE="/opt/vlang"
RUN die() { printf 'FATAL: %s\n' "$2" ; exit "$1" ;} ; [ ! -d "$VLANG_SOURCE" ] && { git clone https://github.com/vlang/v /tmp/vlang || die 1 "Unable to clone vlang in '$VLANG_SOURCE'" ;}
RUN if ! command -v v >/dev/null; then { make -C "$VLANG_SOURCE" || die 1 "Unable to compile vlang in '$VLANG_SOURCE' for deploy" ;}; fi
# Selfcheck
RUN "$VLANG_SOURCE/v" symlink || exit 1
#RUN sh -c "if ! command -v v >/dev/null && [ -f \"$VLANG_SOURCE/v\" ]; then [ ! -x \"$VLANG_SOURCE/v\" ] && { chmod +x \"$VLANG_SOURCE/v\" || { printf 'FATAL: %s\n' \"Unable to set executable permission on '$VLANG_SOURCE/v'\" ; exit 1 ;};} [ -f \"$VLANG_SOURCE/v\" ] && { \"$VLANG_SOURCE/v\" --symlink || { printf 'FATAL: %s\n' \"Unable to symlink vlang executable\" ; exit 1 ;};} elif ! command -v v >/dev/null && [ ! -f \"$VLANG_SOURCE/v\" ]; then { printf 'FATAL: %s\n' \"File '$VLANG_SOURCE/v' is not available, but vlang compilation passed - update of vlang?\" ; exit 1 ;}; else { printf 'FATAL: %s\n' \"Unexpected happend while selfchecking vlang\" ; exit 256 ;}; fi"