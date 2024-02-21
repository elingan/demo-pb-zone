FROM alpine:latest

ARG PB_VERSION=0.21.3
ARG PB_ORIGINS="https://app.alamesa.at,https://admin.alamesa.at"
ARG PB_DEV_MODE=--dev

# "openssh" is needed only if you want to use scp to copy later your pb_data locally
RUN apk add --no-cache \
  unzip \
  ca-certificates \
  openssh

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# uncomment to copy the local pb_migrations dir into the container
# COPY ./pb_migrations /pb/pb_migrations

# the local pb_public dir into the container
COPY ./pb_public /pb/pb_public

# the local pb_hooks dir into the container
COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080

# start PocketBase  "--origins", "${PB_ORIGINS}", ${PB_DEV_MODE}
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--hooksWatch=false"]
