# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "CodeFirst.csproj"
RUN dotnet build "CodeFirst.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "CodeFirst.csproj" -c Release -o /app/publish

# Final stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CodeFirst.dll"]