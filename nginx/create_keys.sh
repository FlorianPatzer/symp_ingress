#!/bin/bash
echo What\'s the address of your server. \(Wrong address will cause connection issues when validating self signed CA\)
read server_address

mkdir ssl

keytool -genkeypair -keyalg RSA -keysize 2048 -alias SympClient -dname "CN=$server_address,OU=IOSB,O=Fraunhofer,C=DE" -validity 3650 -keystore ./ssl/keystore.jks -storepass SympClient -keypass SympClient -deststoretype pkcs12

keytool -importkeystore -srckeystore ./ssl/keystore.jks -srcstorepass SympClient -destkeystore ./ssl/client.p12 -deststorepass SympClient -deststoretype pkcs12

openssl pkcs12 -in ./ssl/client.p12 -nodes -nocerts -out ./ssl/private.pem -password pass:SympClient
openssl pkcs12 -in ./ssl/client.p12 -out ./ssl/cert.crt -nokeys -password pass:SympClient

echo Done

