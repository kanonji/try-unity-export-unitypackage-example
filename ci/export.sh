#! /bin/sh
set -evu

UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
PROJECT_PATH=$(pwd)

${UNITY} \
  -exportPackage ${EXPORT_DIRS} ${PACKAGE_NAME} \
  -projectPath ${PROJECT_PATH} \
  -batchmode \
  -nographics \
  -quit \
  -logfile
ls -al
