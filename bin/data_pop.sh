#!/bin/bash

etcdport=`docker port etcd2prometheus_etcd1_1 | grep 2379 | cut -f2- -d:`
promport=`docker port etcd2prometheus_prom_1 | cut -f2- -d:`

key="quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7quay.io/coreos/etcd:v3.1.7"

function received {
    for i in `seq 1 400000`; do
        curl http://127.0.0.1:${etcdport}/v2/keys/$i
    done
}

function failed {
    for i in `seq 1 1000`; do
        # generate 400
        curl -H 'Host:' http://127.0.0.1:${etcdport}/v2/keys/$1 -XGET -v
    done
}

received
failed

echo -e "\nComplete!\n"

echo "View results here http://127.0.0.1:$promport"
