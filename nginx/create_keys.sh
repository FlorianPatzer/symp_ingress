#!/bin/bash
echo "What's the address of your server?(Wrong address will cause connection issues when validating self signed CA)"
read server_address

echo "What's the organization unit of your server?"
read server_ou

echo "What's the organization name of your server?"
read server_o

echo "What's the country of your server?"
read server_c

echo "How long should the certificate be valid? (in days)"
read cert_validity

echo "Enter a password for the keystore: (min 6 characters)"
read -s key_store_pass

# Creating cert for custom address
mkdir ssl

keytool -genkeypair -keyalg RSA -keysize 2048 -alias SympClient -dname "CN=$server_address,OU=$server_ou,O=$server_o,C=$server_c" -validity $cert_validity -keystore ./ssl/keystore.jks -storepass $key_store_pass -keypass $key_store_pass -deststoretype pkcs12

keytool -importkeystore -srckeystore ./ssl/keystore.jks -srcstorepass $key_store_pass -destkeystore ./ssl/client.p12 -deststorepass $key_store_pass -deststoretype pkcs12

openssl pkcs12 -in ./ssl/client.p12 -nodes -nocerts -out ./ssl/private.pem -password pass:$key_store_pass
openssl pkcs12 -in ./ssl/client.p12 -out ./ssl/cert.crt -nokeys -password pass:$key_store_pass

#Creating wildcard cert for address *service-name*.ingress.docker
mkdir ssl_wildcard

keytool -genkeypair -keyalg RSA -keysize 2048 -alias SympClient -dname "CN=*.ingress.docker,OU=$server_ou,O=$server_o,C=$server_c" -validity $cert_validity -keystore ./ssl_wildcard/keystore.jks -storepass $key_store_pass -keypass $key_store_pass -deststoretype pkcs12

keytool -importkeystore -srckeystore ./ssl_wildcard/keystore.jks -srcstorepass $key_store_pass -destkeystore ./ssl_wildcard/client.p12 -deststorepass $key_store_pass -deststoretype pkcs12

openssl pkcs12 -in ./ssl_wildcard/client.p12 -nodes -nocerts -out ./ssl_wildcard/private.pem -password pass:$key_store_pass
openssl pkcs12 -in ./ssl_wildcard/client.p12 -out ./ssl_wildcard/cert.crt -nokeys -password pass:$key_store_pass

echo Done

