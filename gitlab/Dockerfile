FROM docker:latest

RUN apk update \
    && apk upgrade \
    && apk --no-cache add --virtual .build-deps curl \
    && apk --no-cache add -u py2-pip ca-certificates \
    && pip install awscli awsebcli \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/v1.8.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge .build-deps \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /root/.kube \
    && mkdir -p /root/.aws \
    && kubectl version --client \
    && eb --version \
    && aws --version