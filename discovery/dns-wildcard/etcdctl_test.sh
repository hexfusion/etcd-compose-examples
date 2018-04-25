#!/bin/bash

etcdctl --cacert certs/ca.pem \
    --cert certs/client.pem \
	--key certs/client-key.pem \
	--endpoints=https://172.16.8.219:2379 \
    member list
