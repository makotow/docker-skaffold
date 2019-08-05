ARG  DOCKER_IMAGE=noop
FROM $DOCKER_IMAGE

ARG VERSION=0
ARG SKAFFOLD_VERSION=0
ARG KUBECTL_VERSION=0

LABEL version=$VERSION \
      docker-iamge=$DOCKER_IMAGE \
      skaffold-version=$SKAFFOLD_VERSION \
      kubectl-version=$KUBECTL_VERSION

RUN apk add --update --no-cache curl git && \
      curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/$SKAFFOLD_VERSION/skaffold-linux-amd64 && \
      chmod +x skaffold && \
      mv skaffold /usr/local/bin && \
      curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
      chmod +x ./kubectl && \
      mv ./kubectl /usr/local/bin/kubectl

CMD ["sh"]
