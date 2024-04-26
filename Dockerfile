FROM alpine:3.19

ARG AWS_DEFAULT_REGION=us-east-1
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG INFRACOST_API

ENV TERRAFORM_VERSION=1.8.2
ENV TRIVY=0.50.4
ENV TERRAFORM_DOCS=0.17.0
ENV INFRACOST=0.10.35
ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV INFRACOST_API=$INFRACOST_API

RUN apk update && \
    apk add --update curl git wget bash dpkg

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

RUN curl -LO https://github.com/aquasecurity/trivy/releases/download/v${TRIVY}/trivy_${TRIVY}_Linux-AMD64.tar.gz && \
    tar -xvf trivy_${TRIVY}_Linux-AMD64.tar.gz && \
    chmod +x trivy && \
    mv trivy /usr/bin/trivy

RUN wget https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS}/terraform-docs-v${TERRAFORM_DOCS}-linux-amd64.tar.gz && \
    tar -xvf terraform-docs-v${TERRAFORM_DOCS}-linux-amd64.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/bin/terraform-docs

RUN wget https://github.com/infracost/infracost/releases/download/v${INFRACOST}/infracost-linux-amd64.tar.gz && \
    tar -xvf infracost-linux-amd64.tar.gz && \
    mv infracost-linux-amd64 /usr/bin/infracost

RUN rm -rf /tmp/*

WORKDIR /data