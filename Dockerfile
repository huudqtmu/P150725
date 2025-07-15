
 # Base image chỉ để chạy (runtime)
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

#thiet lap cong trong noi bo docker
EXPOSE 3000

# Copy bản đã publish vào image
COPY ./publish ./

# Lệnh chạy ứng dụng
ENTRYPOINT ["dotnet", "p150725.dll"]
