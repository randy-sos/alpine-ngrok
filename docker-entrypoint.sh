#!/bin/sh

ngrok http -bind-tls=true -inspect=false 80  > /var/log/ngrok/ngrok.log 2>&1
