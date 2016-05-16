FROM vintec/basejava:v8
MAINTAINER Isidoro Trevino "isidoro.trevino@vintec.mx"

RUN wget http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/mars/2/eclipse-dsl-mars-2-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    sudo apt-get update && sudo apt-get install -y libgtk2.0-0 libcanberra-gtk-module && \
    sudo tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz

ADD run /usr/local/bin/eclipse

RUN sudo chown -R developer:developer /opt/ && \
    sudo chmod +x /usr/local/bin/eclipse

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /usr/local/bin/eclipse

