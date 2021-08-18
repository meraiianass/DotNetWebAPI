FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY *.csproj App/
WORKDIR /App
ENTRYPOINT ["dotnet", "WebAPI.dll"]
