all:
	${CC} ${CFLAGS}  -Wall ctapudp.c sha.c keyqueue.c post_curl.c thpool.c -lcrypto -lcurl -lz -pthread -lm ${LDFLAGS} -o ctapudp
clean:
	rm ctapudp
