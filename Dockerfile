
 FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
 WORKDIR /app
 EXPOSE 80
 FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
 WORKDIR /src
 COPY ["WebAPI.csproj", ""]
 RUN dotnet restore "./WebAPI.csproj"
 COPY . .
 WORKDIR "/src/."
 RUN dotnet build "WebAPI.csproj" -c Release -o /app/build
 FROM build AS publish
 RUN dotnet publish "WebAPI.csproj" -c Release -o /app/publish
 FROM base AS final
 WORKDIR /app
 COPY --from=publish /app/publish .
 ENTRYPOINT ["dotnet", "WebAPI.dll"]
 
