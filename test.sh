#!/bin/sh

KEYWORKER="http://localhost:55554"

curl -s -X DELETE -H "Content-Type: application/json" http://localhost:5000/keyworker
curl -s -X DELETE -H "Content-Type: application/json" http://localhost:5001/keyworker

echo curl -s -X POST -H "Content-Type: application/json" -d '{ "keyworkers": [{"address":"'$KEYWORKER'","id":0}] }' http://localhost:5000/keyworker/register
curl -s -X POST -H "Content-Type: application/json" -d '{ "keyworkers": [{"address":"'$KEYWORKER'","id":0}] }' http://localhost:5000/keyworker/register
echo curl -s -X POST -H "Content-Type: application/json" -d '{ "keyworkers": [{"address":"'$KEYWORKER'","id":0}] }' http://localhost:5001/keyworker/register
curl -s -X POST -H "Content-Type: application/json" -d '{ "keyworkers": [{"address":"'$KEYWORKER'","id":0}] }' http://localhost:5001/keyworker/register

qcrypt/qcrypt qcrypt/coder0.cfg > /tmp/coder.log 2>&1 &
qcrypt/qcrypt qcrypt/decoder0.cfg > /tmp/decoder.log 2>&1 &

QKD_emulator/qkdemu 127.0.0.1:78 127.0.0.1:77 > /tmp/qkdemu.log 2>&1

tcpdump -A -i lo port 5001 > /tmp/tcpdump.raw.log 2>&1 &
tcpdump -A -i lo port 2222 > /tmp/tcpdump.qkd.log 2>&1 &

echo Press ENTER
read
echo Connection without coding

curl -s -X POST -H "Content-Type: application/json" -d '{
 "nodes": [{"address":"http://localhost:5001","keyworker_id":0}]
}' "http://localhost:5000/nodes/register"

curl http://localhost:5000/nodes/resolve

echo Press ENTER
read
echo Connection with coding
curl -s -X DELETE -H "Content-Type: application/json" http://localhost:5000/nodes
curl -s -X POST -H "Content-Type: application/json" -d '{
 "nodes": [{"address":"http://localhost:7777","keyworker_id":0}]
}' "http://localhost:5000/nodes/register"

curl http://localhost:5000/nodes/resolve

killall qcrypt/qcrypt > /dev/null 2>&1
killall tcpdump > /dev/null 2>&1

