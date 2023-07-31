FROM mcr.microsoft.com/dotnet/sdk:latest

RUN apt-get update
RUN apt-get install azure-cli -y

CMD ["bash"]
