FROM mcr.microsoft.com/dotnet/sdk:latest

RUN apt-get update
RUN apt-get install azure-cli wget apt-transport-https software-properties-common jq docker -y
RUN az aks install-cli
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
RUN mv linux-amd64/helm /usr/bin/helm
# RUN wget -q "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb"
# RUN dpkg -i packages-microsoft-prod.deb
# RUN rm packages-microsoft-prod.deb
# RUN apt-get update && apt-get install -y
# RUN apt-get install -y powershell
RUN curl -SL https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
CMD ["bash"]
