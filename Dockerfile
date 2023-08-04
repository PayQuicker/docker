# FROM mcr.microsoft.com/dotnet/sdk:latest

# RUN apt-get update
# RUN apt-get install azure-cli wget apt-transport-https software-properties-common jq docker -y
# RUN az aks install-cli
# RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
# RUN mv linux-amd64/helm /usr/bin/helm
# RUN wget -q "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb"
# RUN dpkg -i packages-microsoft-prod.deb
# RUN rm packages-microsoft-prod.deb
# RUN apt-get update && apt-get install -y
# RUN apt-get install -y powershell
# RUN curl -SL https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
# CMD ["bash"]


FROM docker:23.0-cli
RUN apk add --no-cache --update bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib jq
RUN apk add --no-cache --update libgdiplus
RUN apk add --no-cache --update python3 py3-pip 
RUN apk add --no-cache --update --virtual=build gcc musl-dev python3-dev libffi-dev openssl-dev cargo make && pip3 install --no-cache-dir --prefer-binary azure-cli
RUN az aks install-cli
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
RUN mv linux-amd64/helm /usr/bin/helm
RUN mkdir -p /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 
RUN wget https://dot.net/v1/dotnet-install.sh
RUN chmod +x dotnet-install.sh
RUN ./dotnet-install.sh -c 7.0 --install-dir /usr/share/dotnet
