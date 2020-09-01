# epics-docker
Docker images for EPICS 3 and 7, and EPICS 7 + PCAS

## EPICS 3

Dockerfile: https://github.com/jalalmostafa/epics-docker/blob/master/epics3/Dockerfile

### How to run

Mount records database to `/opt/epics/config/db.db`

docker run -d --name epics-softioc -p 5064:5064/tcp -p 5064:5064/udp -p 5065:5065/udp --mount type=bind,source="$(pwd)"/test.db,target=/opt/epics/config/db.db jalalmostafa/epics-softioc:3.15.6

## EPICS 7

Dockerfile: https://github.com/jalalmostafa/epics-docker/blob/master/epics7/Dockerfile

### How to run

Mount records database to `/opt/epics/config/db.db`

docker run -d --name epics-softioc -p 5064:5064/tcp -p 5064:5064/udp -p 5065:5065/udp --mount type=bind,source="$(pwd)"/test.db,target=/opt/epics/config/db.db jalalmostafa/epics-softioc:7.0.4

## Portable Channel Access Server (PCAS)

[EPICS7](https://epics.anl.gov/base/R7-0/4.php) + [pcaspy](https://epics.anl.gov/extensions/cas/index.php) + [PCASPY](https://github.com/paulscherrerinstitute/pcaspy)

Dockerfile: https://github.com/jalalmostafa/epics-docker/blob/master/epics7-pcas/Dockerfile


### How to run:

Set `PCAS_PY_FILE` to your pcaspy python file.


docker run -d --name epics-pcas -p 5064:5064/tcp -p 5064:5064/udp -p 5065:5065/udp --mount type=bind,source="$(pwd)"/adeireplay.py,target=/opt/epics/config/adeireplay.py -e PCAS_PY_FILE=/opt/epics/config/adeireplay.py jalalmostafa/epics-pcas:7.0.4