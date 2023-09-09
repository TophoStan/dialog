# TODO: need a better one
PUB_IP_CURL=https://ipinfo.io/ip

healthcheck() {
  while true; do
    (echo -e 'HTTP/1.1 200 OK') | nc -lp 1111 > /dev/null
  done
}

# healthcheck &
echo -e $(echo -e ${perms_key//\n/}) > /dialog/certs/perms.pub.pem
head -3 /dialog/certs/perms.pub.pem
export MEDIASOUP_ANNOUNCED_IP=$(curl ${PUB_IP_CURL})
echo "MEDIASOUP_ANNOUNCED_IP: $MEDIASOUP_ANNOUNCED_IP"
export INTERACTIVE=nope

# npm start
DEBUG='*INFO* *WARN* *ERROR*' node index.js
