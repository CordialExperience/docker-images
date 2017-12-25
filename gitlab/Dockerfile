FROM docker:latest

ENV HELM_VERSION="v2.7.2"
ENV KUBE_VERSION="v1.9.0"
ENV FILENAME="helm-${HELM_VERSION}-linux-amd64.tar.gz"

RUN apk update \
    && apk upgrade \
    && apk --no-cache add --virtual .build-deps curl \
    && apk --no-cache add -u py2-pip ca-certificates \
    && pip install awscli awsebcli \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl -L http://storage.googleapis.com/kubernetes-helm/${FILENAME} -o /tmp/${FILENAME} \
    && tar -zxvf /tmp/${FILENAME} -C /tmp \
    && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
    && apk del --purge .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && mkdir -p /root/.kube \
    && mkdir -p /root/.aws \
    && mkdir -p /root/.helm \
    && kubectl version --client \
    && helm version --client \
    && eb --version \
    && aws --version