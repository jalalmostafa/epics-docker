FROM debian:jessie

RUN mkdir /opt/epics
WORKDIR /opt/epics/

RUN apt update 
RUN apt install -y apt-transport-https wget
RUN wget --quiet https://epicsdeb.bnl.gov/debian/repo-key.pub -O - | apt-key add -
RUN echo "deb https://epicsdeb.bnl.gov/debian/ jessie main contrib" | tee -a /etc/apt/sources.list
RUN echo "deb-src https://epicsdeb.bnl.gov/debian/ jessie main contrib" | tee -a /etc/apt/sources.list
RUN apt update 
RUN apt install -y epics-dev procserv telnet

RUN mkdir /opt/epics/config
RUN echo 'record(ai, "hello:pv") {}' > /opt/epics/config/db.db
VOLUME [ "/opt/epics/config" ]

EXPOSE 5064/tcp
EXPOSE 5065/tcp
EXPOSE 5064/udp
EXPOSE 5065/udp

COPY st.cmd /opt/epics/st.cmd
RUN chmod +x /opt/epics/st.cmd

CMD [ "procServ", "-i", "^D^C", "-f", "20000", "/opt/epics/st.cmd" ]
