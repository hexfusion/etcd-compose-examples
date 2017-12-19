#!/bin/bash

etcdport=`docker port etcd2prometheus_etcd1_1 | grep 2379 | cut -f2- -d:`
promport=`docker port etcd2prometheus_prom_1 | cut -f2- -d:`

function valid {
    for i in `seq 1 1000`; do
	    curl http://127.0.0.1:${etcdport}/v2/keys/$i
	done
}

function invalid {
    for i in `seq 1 1000`; do
	    # generate 400
	    curl -H 'Host:' http://127.0.0.1:${etcdport}/v2/keys/$1 -XGET -v
	done
}

valid
invalid

echo -e "\nComplete!\n"

echo "View results here http://127.0.0.1:$promport"
