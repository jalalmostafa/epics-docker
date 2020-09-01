#! /opt/epics/bin/linux-x86_64/softIoc

< envPaths

## Register all support components
dbLoadDatabase("/opt/epics/dbd/softIoc.dbd")
softIoc_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("/opt/epics/config/db.db")

iocInit
