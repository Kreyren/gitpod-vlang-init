FROM gitpod/workspace-full-vnc:latest

### VLANG ###
USER root
RUN wget https://github.com/Kreyren/gitpod-vlang-init/blob/master/gitpod/vlang_init.sh -O /usr/bin/vlang_init || exit 1
RUN chmod +x /usr/bin/vlang_init || exit 1
RUN /usr/bin/vlang_init
