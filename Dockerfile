FROM jamesdbloom/docker-java8-maven
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -q -y libkrb5-dev
RUN apt-get install -q -y libldap2-dev
RUN apt-get install -q -y libmysqlclient-dev
RUN apt-get install -q -y libsasl2-dev
RUN apt-get install -q -y libsasl2-modules-gssapi-mit
RUN apt-get install -q -y libsqlite3-dev
RUN apt-get install -q -y libssl-dev
RUN apt-get install -q -y libtidy-0.99-0
RUN apt-get install -q -y libxml2-dev
RUN apt-get install -q -y libxslt-dev
RUN apt-get install -q -y libgmp3-dev
RUN apt-get install -q -y mysql-server
RUN apt-get install -q -y python-dev
RUN apt-get install -q -y python-setuptools
RUN apt-get install -q -y python-simplejson
RUN ln -s /usr/lib/python2.7/plat-*/_sysconfigdata_nd.py /usr/lib/python2.7/

WORKDIR /home/docker
RUN wget https://dl.dropboxusercontent.com/u/730827/hue/releases/3.9.0/hue-3.9.0.tgz
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz

RUN tar xvfz hue-3.9.0.tgz && cd hue-3.9.0 && make
ENV PATH="/home/docker/spark-1.5.1-bin-hadoop2.6/bin:/home/docker/hue-3.9.0/build/env/bin:$PATH"

EXPOSE 8888
CMD ["/bin/bash"]
