FROM microsoft/dotnet:3.0-aspnetcore-runtime
LABEL version="3.0" description= "ASP NET Core com MVC Test - MYSQL"
COPY dist /app
WORKDIR /app
EXPOSE 80/tcp
ENTRYPOINT [ "dotnet","mvc1.dll" ]