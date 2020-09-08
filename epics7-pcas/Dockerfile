FROM jalalmostafa/epics-softioc:7.0.4

LABEL maintainer="Jalal Mostafa <jalalmostafa22@gmail.com>"

# Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 0.0.2
ENV PYTHONUNBUFFERED 1

# Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Build EPICS Servers with Portable Channel Access Server and python3" \
    io.k8s.display-name="epics-pcas 0.0.1" \
    io.openshift.expose-services="5064/tcp:cas-5064-tcp,5064/udp:cas-5064-udp,5065/udp:cas-5065-udp" \
    io.openshift.tags="epics-pcas 0.0.1"

RUN cd /opt/epics/modules && git clone https://github.com/epics-modules/pcas.git
COPY Makefile.local /opt/epics/modules/Makefile.local
RUN cd /opt/epics/ && make

RUN apt install -y python3 python3-pip swig
RUN pip3 install virtualenv
RUN pip3 install git+git://github.com/paulscherrerinstitute/pcaspy.git 
RUN virtualenv venv

# Copy the S2I scripts to /usr/libexec/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i
COPY ./s2i/bin/ /usr/local/s2i

# Drop the root user and make the content of /opt/epics owned by user 1001
RUN chown -R 1001:1001 /opt/epics

# This default user is created in the openshift/base-centos7 image
USER 1001

# Set the default CMD for the image
CMD [ "usage" ]
