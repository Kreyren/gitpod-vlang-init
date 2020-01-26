FROM gitpod/workspace-full-vnc:latest

## VLANG ##
# WTF: LABEL dazzle/layer=tool-brew
# WTF: LABEL dazzle/test=tests/tool-brew.y
USER root
COPY vlang_deploy.sh /usr/bin/vlang_deploy
RUN [ ! -x /usr/src/vlang_deploy ] && { chmod +x /usr/bin/vlang_deploy || { printf 'FATAL: %s\n' "Unable to set executable permission on '/usr/bin/vlang_deploy'" ; exit 1 ;} ;}
RUN case $(/usr/bin/vlang_deploy ; echo $?) in 1) { printf 'FATAL: %s\n' "Deploy of vlang failed" ; exit 1 ;} ;; 126) printf 'FATAL: %s\n' "File '/usr/bin/vlang_deploy' is not executable" ;; *) { printf 'FATAL: %s\n' "Unexpected happend while deploying vlang" ; exit 256 ;}; esac