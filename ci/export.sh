#! /bin/sh

UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
PROJECT_PATH=$(pwd)
LOG_FILE="${PROJECT_PATH}/unity.log"

${UNITY} \
  -exportPackage ${EXPORT_DIRS} ${PACKAGE_NAME} \
  -projectPath $(pwd) \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logfile ${LOG_FILE} \
  -quit &
tail -f --pid $! ${LOG_FILE} &
fg %1