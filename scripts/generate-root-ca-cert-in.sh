#!/bin/bash
echo "Generating root CA certificate"
MSYS_NO_PATHCONV=1 docker run --rm -v $PWD/../ca/in:/ca alpine/openssl genrsa -out /ca/ca.key 4096
MSYS_NO_PATHCONV=1 docker run --rm -v $PWD/../ca/in:/ca alpine/openssl req -new -x509 -days 3650 -key /ca/ca.key -out /ca/ca.pem -config /ca/ca_config.cnf
MSYS_NO_PATHCONV=1 docker run --rm -v $PWD/../ca/in:/ca --entrypoint "/bin/sh" alpine/openssl -c "openssl x509 -pubkey -noout -in /ca/ca.pem | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | base64 > /ca/sha256_base64"
cat ../ca/in/ca.key ../ca/in/ca.pem > ../ca/in/mitmproxy-ca.pem
