# savage-rifts-gen

1. Install mysql, run `sql/1.sql` to create database
2. Create user with privileges to `savage_rifts` database
3. Run the rest of the sql files in order
4. Either edit src/main/resources/application.properties (for local), or create an application.properties file with these properties (for prod)
```
spring.datasource.url=jdbc:mysql://127.0.0.1/savage_rifts
spring.datasource.username=<user>
spring.datasource.password=<password>

encryptionkey=<encryptionkey>
```
5. Install maven
6. Install bower through npm
7. Run `mvn package [-Pprod]`
8. Run `java -jar <build jar file> -spring.application.location=classpath:/.`