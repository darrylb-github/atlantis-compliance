FROM runatlantis/atlantis:latest

ARG TF_COMPLIANCE_VERSION=1.0.50

RUN apk add --no-cache python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    pip install terraform-compliance==${TF_COMPLIANCE_VERSION} && \
    pip uninstall -y radish radish-bdd && \
    pip install radish radish-bdd && \
    mkdir -p /target
