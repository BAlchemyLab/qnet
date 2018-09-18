Build:
=======

`sudo yum install gcc make libmicrohttpd-devel libconfig-devel`

`make qcrypt`

Requirements:
=======

Proxy server on port 3128 (on machine with decoder)


Parameters:
=======

`./qcrypt -h` - help


`./qcrypt [config.cfg]`

- config.cfg - config file



Starting process:
=======


Proxy server (squid on port 3128)


Decoder (wait for connections on port 2222, send information to 127.0.0.1:7777, control channel on port 77):

`./qcrypt decoder.cfg`


Coder (wait for connections on port 7777, send information to 127.0.0.1:3128, control channel on port 78):

`./qcrypt coder.cfg`


Client (Web browser 127.0.0.1:2222)


Control:
=======
Connection to control channel:

`nc 127.0.0.1 77`


Commands: 

r - reread keys (against mode=0)

quit


For keys send by cUrl (with mode=0):
=======

Use programm KQD (Quantum Key Distribution) HW software emulator.

`./qkdemu 127.0.0.1:78 127.0.0.1:77`

Cfg-files
=======

// mode (int) :

//	0 - read by curl request (./qkdemu)

//	1 - read symbol by symbol

//	2 - plug&play

`mode = 1;`

// coder (int) :

//	0 - Decoder

//	1 - Coder

`coder = 1;`

//port (int) - Listening port

`port = 7777;`

//IP (string) - IP connect to

`ip = "127.0.0.1";`

//portDest (int) - Connect to port

`portDest = 2222;`

//portCtrl (int) - Control port

`portCtrl = 78;`

//if mode == 1 - keys directory and file ending mask

`keyDir = "/opt/qcrypt/share/qbcrypt";`

`keyTail = "_Bob.key";`

//if mode == 2 - keyfile

`keyFile = "/opt/qcrypt/share/qacrypt/Bob_Code.txt";`

