#!/bin/bash -
# Harris Ransom
# From: Cybersecurity Ops with bash
# winlogs.sh
#
# Description:
# Gather copies of Windows log files
#
# Usage:
# winlogs.sh [-z] [dir]
# -z Tar and zip the output
# dir Optional scratch directory for holding the log files

TGZ=0
if (( $# > 0 ))
then
if [[ ${1:0:2} == '-z' ]]
then
TGZ=1 # tgz flag to tar/zip the log files
shift
fi
fi
SYSNAM=$(hostname)
LOGDIR=${1:-/tmp/${SYSNAM}_logs}
mkdir -p $LOGDIR
cd ${LOGDIR} || exit -2
wevtutil el | while read ALOG
do
ALOG="${ALOG%$'\r'}"
echo "${ALOG}:"
SAFNAM="${ALOG// /_}"
SAFNAM="${SAFNAM//\//-}"
wevtutil epl "$ALOG" "${SYSNAM}_${SAFNAM}.evtx"
done
if (( TGZ == 1 ))
then
tar -czvf ${SYSNAM}_logs.tgz *.evtx
fi