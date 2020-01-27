FROM gitpod/workspace-full-vnc:latest

### VLANG ###
USER root
RUN wget https://raw.githubusercontent.com/Kreyren/gitpod-vlang-init/master/gitpod/vlang_init.sh -O /usr/bin/vlang_init || exit 1
RUN chmod +x /usr/bin/vlang_init || exit 1
RUN /usr/bin/vlang_init
RUN echo hello