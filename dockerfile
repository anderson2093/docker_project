# Utilizamos la imagen oficial de Keycloak como base
FROM quay.io/keycloak/keycloak:latest

# Configuramos las variables de entorno para la base de datos
ENV DB_VENDOR=postgres
ENV DB_USER=c18_39_n_java_angular
ENV DB_PASSWORD=Ej0Nm4ltamnFJVL9do7UDlKZdivvvpce
ENV DB_URL=postgresql://dpg-cp4mmegcmk4c73emahkg-a.oregon-postgres.render.com/docspot

# Configuramos las variables de entorno para Keycloak
ENV KEYCLOAK_USER_ADMIN=docspot.nocountry@gmail.com
ENV KEYCLOAK_PASSWORD_ADMIN=admin
ENV KEYCLOAK_REALM=docspot

# Copiamos el archivo de configuración de Keycloak
COPY conf/keycloak.json /opt/keycloak/conf/

# Ejecutamos el comando para inicializar la base de datos
RUN bin/kc.sh init db

# Ejecutamos el comando para crear el realm
RUN bin/kc.sh create-realm --realm $KEYCLOAK_REALM

# Ejecutamos el comando para crear el usuario administrador
RUN bin/kc.sh add-user --realm $KEYCLOAK_REALM --username $KEYCLOAK_USER_ADMIN --password $KEYCLOAK_PASSWORD_ADMIN

# Exponemos el puerto 8080 para que Render pueda acceder a Keycloak
EXPOSE 8080

# Ejecutamos el comando para iniciar Keycloak
CMD ["-b", "0.0.0.0", "-Dkeycloak.profile.feature.upload_scripts=enabled"]