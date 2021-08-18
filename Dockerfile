FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY WebAPI/*.csproj App/
WORKDIR /App
ENTRYPOINT ["dotnet", "WebAPI.dll"]
