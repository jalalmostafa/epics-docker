#! /usr/bin/softIoc

< envPaths

## Register all support components
dbLoadDatabase("/usr/lib/epics/dbd/softIoc.dbd")
softIoc_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("/opt/epics/config/db.db")

iocInit
