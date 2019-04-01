FROM mcr.microsoft.com/dotnet/core/sdk
ENV CONTAINER_PATH /usr/src/app
WORKDIR $CONTAINER_PATH

COPY . . 
RUN ls
#
#COPY './AutoMagically.Presentation/AutoMagically.Presentation.csproj' ./AutoMagically.Presentation
#RUN ls
#COPY './AutoMagically.Domain/AutoMagically.Domain.csproj' ./AutoMagically.Domain
#COPY './AutoMagically.Infrastructure/AutoMagically.Infrastructure.csproj' ./AutoMagically.Infrastructure

WORKDIR  ./AutoMagically.Presentation/
RUN dotnet restore 'AutoMagically.Presentation.csproj'
RUN dotnet build 'AutoMagically.Presentation.csproj'
RUN dotnet publish  'AutoMagically.Presentation.csproj'  -o dist 

ENTRYPOINT ["dotnet","../dist/AutoMagically.Presentation.dll"]