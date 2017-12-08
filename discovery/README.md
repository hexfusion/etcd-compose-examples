# generate and update discovery token in compose file
# assumes /etc/ssl/certs/ca-certificates.crt exists locally

`curl -w "\n" 'https://discovery.etcd.io/new?size=3'`
https://discovery.etcd.io/7e9fa23d5232c3218f33b80c91a7b5cd

ETCD_DISCOVERY: https://discovery.etcd.io/7e9fa23d5232c3218f33b80c91a7b5cd

`docker-compose up -d`

`docker-compose logs etcd1`



