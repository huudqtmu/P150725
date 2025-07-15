#-- tài image => kiểu như cài netcore lên máy
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

#thiet lap cong trong noi bo docker
EXPOSE 3000

# Stage 1: build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["P150725.csproj","src/"]
RUN dotnet restore "src/P150725.csproj"
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Stage 2: runtime
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "P150725.dll"]
