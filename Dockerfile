FROM debian:jessie

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
	echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list && \
    apt-get update --fix-missing && \
    apt-get install -y hhvm

COPY php.ini /etc/hhvm/php.ini

EXPOSE 9000

CMD ["hhvm", "--mode=server"]
