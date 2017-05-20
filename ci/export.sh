#! /bin/sh
set -evu

UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
PROJECT_PATH=$(pwd)
LOG_FILE="${PROJECT_PATH}/unity.log"

${UNITY} \
  -exportPackage ${EXPORT_DIRS} ${PACKAGE_NAME} \
  -projectPath $(pwd) \
  -batchmode \
  -nographics \
  -logfile ${LOG_FILE} \
  -quit &
PID=$!
tail -f ${LOG_FILE} &
PID_TAIL=$!
fg ${PID}
kill ${PID_TAIL}
cat ${LOG_FILE}
ls -al
