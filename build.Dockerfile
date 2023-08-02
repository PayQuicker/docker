FROM mcr.microsoft.com/dotnet/sdk:latest

RUN apt-get update
RUN apt-get install azure-cli apt-get install wget apt-transport-https software-properties-common -y
RUN wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y

CMD ["bash"]
