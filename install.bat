del dist
docker container stop mvcprodutos 
docker container stop mysql 
docker container stop mvcapp1 
docker container stop mvcapp2 
docker container stop mvcapp3 
docker container stop loadbalancer
docker rm mvcprodutos
docker rm mysql
docker rm mvcapp1
docker rm mvcapp2
docker rm mvcapp3
docker rm loadbalancer
docker rmi azevedosgustavo/aspnetmvctest:1.0
docker rmi azevedosgustavo/aspnetmvctest:2.0
docker rmi azevedosgustavo/aspnetmvctest:3.0
docker instal
dotnet publish --configuration Release --output dist
docker build -t azevedosgustavo/aspnetmvctest:3.0 .
docker container run --name mysql -v produtosdata:/var/lib/mysql --network=backend -e MYSQL_ROOT_PASSWORD=123456 -e bind-address=0.0.0.0 mysql:5.7
docker container run --name mvcapp1 -e DBHOST=mysql --network backend azevedosgustavo/aspnetmvctest:3.0
docker container run --name mvcapp2 -e DBHOST=mysql --network backend azevedosgustavo/aspnetmvctest:3.0
docker container run --name mvcapp3 -e DBHOST=mysql --network backend azevedosgustavo/aspnetmvctest:3.0
docker network connect frontend mvcapp1
docker network connect frontend mvcapp2
docker network connect frontend mvcapp3
docker container start mysql mvcapp1 mvcapp2 mvcapp3 
docker container run -d --name loadbalancer --network frontend -v "$(pwd)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg" -p 3200:80 haproxy:1.7.0
docker container run -d --name mvcprodutos -p 3000:80  azevedosgustavo/aspnetmvctest:2.0 -e DBHOST=172.17.0.2 DBPASSWORD=123456