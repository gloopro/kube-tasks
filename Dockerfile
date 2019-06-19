FROM alpine:3.8
RUN apk --no-cache add tar ca-certificates
COPY kube-tasks /usr/local/bin/kube-tasks
COPY archive-backup /usr/local/bin/archive-backup
RUN addgroup -g 1001 -S kube-tasks \
    && adduser -u 1001 -D -S -G kube-tasks kube-tasks
USER kube-tasks
WORKDIR /home/kube-tasks
CMD ["kube-tasks"]
