FROM gitpod/workspace-full-vnc:latest

## VLANG ##
USER gitpod
ENV VLANG_SOURCE="/opt/vlang"
RUN git clone https://github.com/vlang/v "$VLANG_SOURCE" || exit 1
RUN { cd "$VLANG_SOURCE" || exit 1 ;} && make -C "$VLANG_SOURCE" || exit 1
RUN "$VLANG_SOURCE/v" symlink || exit 1
RUN unset VLANG_SOURCE