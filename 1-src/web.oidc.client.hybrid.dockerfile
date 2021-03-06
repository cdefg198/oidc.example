# https://hub.docker.com/r/microsoft/dotnet/
FROM microsoft/dotnet:2.2-sdk-alpine AS builder

COPY . /src

WORKDIR /src

RUN dotnet publish ./web.oidc.client.hybrid/web.oidc.client.hybrid.csproj --output /publish



FROM microsoft/dotnet:2.2.2-aspnetcore-runtime-alpine
 
COPY --from=builder /publish /app

WORKDIR /app

EXPOSE 80

ENTRYPOINT ["dotnet", "Web.Oidc.Client.Hybrid.dll"]