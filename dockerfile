FROM quay.io/keycloak/keycloak:latest

# Set environment variables for Keycloak
ENV KEYCLOAK_ADMIN=docspot.nocountry@gmail.com
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV DB_VENDOR=postgres
ENV DB_ADDR=postgresql://dpg-cp4mmegcmk4c73emahkg-a.oregon-postgres.render.com/docspot
ENV DB_PORT=5432
ENV DB_DATABASE=docspot
ENV DB_SCHEMA=public
ENV DB_USER=c18_39_n_java_angular
ENV DB_PWD=Ej0Nm4ltamnFJVL9do7UDlKZdivvvpce

# Expose the port
EXPOSE 8080

# Set Keycloak frontend URL
ENV KEYCLOAK_FRONTEND_URL=https://docker-project-lll9.onrender.com/

# Enable transaction recovery for Quarkus
ENV QUARKUS_TRANSACTION_MANAGER_ENABLE_RECOVERY=true

# Run the Keycloak server
CMD ["start-dev"]