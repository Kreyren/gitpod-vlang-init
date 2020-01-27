FROM gitpod/workspace-full-vnc:latest

### VLANG ###
USER root
ENV VLANG_SOURCE="/opt/vlang"
RUN git clone https://github.com/vlang/v "$VLANG_SOURCE" || exit 1
RUN chown -R gitpod:gitpod "$VLANG_SOURCE" || exit 1
USER gitpod
RUN make -C "$VLANG_SOURCE" || exit 1
USER root
RUN "$VLANG_SOURCE/v" symlink || exit 1
RUN unset VLANG_SOURCE
