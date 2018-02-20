# QNet

Quantum Network related tools.

## qcrypt

Transport quantum cryptography layer.

## QKD_emulator

Software emulator for QKD (Quantum Key Distribution) hardware.

## keyworker

Server for handling of Quantum keys pool.

## Testing

1) Run two instances of [blockhain] (https://github.com/BAlchemyLab/bal) nodes at 5000 and 5001 ports. For example:
```
pipenv run python blockchain.py -p 5000 -d quant.db -v quant
pipenv run python blockchain.py -p 5001 -d quant.db -v quant
```

2) Look at tcpdump's log files for encrypted (qkd) and unencrypted (raw) channels:
```
tail -F /tmp/tcpdump.qkd.log
tail -F /tmp/tcpdump.raw.log
```

3) Run test script and press ENTER for sending queries through unencrypted and encrypted channels:
```
./test.sh
Press ENTER

Connection without coding
....
Press ENTER

Connection with coding

```
In tcpdump's log files you must see traffic through unencrypted channel in both cases and through encrypted channel in second case.
