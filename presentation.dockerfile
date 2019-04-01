FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS base
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS http://*:5000
EXPOSE 5000
                                                      
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS builder
ARG Configuration=Release
WORKDIR /src
COPY *.sln ./
COPY AutoMagically.Presentation/AutoMagically.Presentation.csproj  ./AutoMagically.Presentation/
COPY AutoMagically.Domain/AutoMagically.Domain.csproj ./AutoMagically.Domain/
COPY AutoMagically.Infrastructure/AutoMagically.Infrastructure.csproj ./AutoMagically.Infrastructure/
                                                       
RUN dotnet restore
COPY . .
                                                      
RUN dotnet build AutoMagically.Presentation/AutoMagically.Presentation.csproj  -c $Configuration -o /app
                                                      
FROM builder AS publish
ARG Configuration=Release
RUN dotnet publish -c $Configuration -o /app
                                                      
FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet","AutoMagically.Presentation.dll"]