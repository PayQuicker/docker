FROM mcr.microsoft.com/azure-cli

RUN az aks install-cli
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz -O - | tar -xz
RUN mv linux-amd64/helm /usr/bin/helm

CMD ["/bin/sh", "-c", "bash"]
