FROM mcr.microsoft.com/dotnet/sdk:7.0.400-alpine3.18-amd64 as sdk

FROM docker:23-dind
COPY --from=sdk / /
RUN apk add --no-cache --update bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib jq git npm yarn
RUN apk add --no-cache --update libgdiplus
RUN apk add --no-cache --update python3 py3-pip 
RUN apk add --no-cache --update --virtual=build gcc musl-dev python3-dev libffi-dev openssl-dev cargo make && pip3 install --no-cache-dir --prefer-binary azure-cli
RUN az aks install-cli
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
RUN mv linux-amd64/helm /usr/bin/helm
ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
