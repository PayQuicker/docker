FROM docker:23.0-cli
RUN apk add --no-cache --update bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib jq git 
RUN apk add --no-cache --update libgdiplus
RUN apk add --no-cache --update python3 py3-pip 
RUN apk add --no-cache --update --virtual=build gcc musl-dev python3-dev libffi-dev openssl-dev cargo make && pip3 install --no-cache-dir --prefer-binary azure-cli
# Install Culture prerequisities
RUN apk add --no-cache \
        icu-data-full \
        icu-libs
# enable all cultures - it is set to true in base image
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
RUN az aks install-cli
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
RUN mv linux-amd64/helm /usr/bin/helm
RUN mkdir -p /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 
RUN wget https://dot.net/v1/dotnet-install.sh
RUN chmod +x dotnet-install.sh
RUN ./dotnet-install.sh -c 7.0 --install-dir /usr/share/dotnet

