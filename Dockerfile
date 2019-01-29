FROM cycognito/gcp-sdk-helm:32c6e8f

ADD assets /opt/resource
RUN chmod +x /opt/resource/*

RUN apk --no-cache add \
        tar \
        bash \
        jq

RUN helm init --client-only  && helm plugin install https://github.com/viglesiasce/helm-gcs.git

ENTRYPOINT [ "/bin/bash" ]
