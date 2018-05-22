FROM ubuntu:16.04

#RUN apt-get update && apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:mozillateam/ppa && apt-get install -y firefox-esr && apt-get install -y sudo && apt-get install -y libcanberra-gtk3-module && apt-get install -y icedtea-plugin

RUN apt-get update && apt-get install -y software-properties-common python-software-properties && apt-get install -y firefox && apt-get install -y sudo && apt-get install -y libcanberra-gtk3-module && apt-get install -y icedtea-8-plugin

RUN apt-get install -y vim-tiny

# Replace 1000 with your user / group id
RUN export uid=1000 gid=50 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

#ADD ./example.jnlp /tmp/example.jnlp
#RUN chmod 0777 /tmp/example.jnlp

RUN sed -i 's/\(^jdk.jar.disabledAlgorithms.*\)\(MD5,\)/\1 /' /etc/java-8-openjdk/security/java.security

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox
