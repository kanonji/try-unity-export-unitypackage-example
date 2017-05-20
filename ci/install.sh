#! /bin/sh
BASE_URL=http://netstorage.unity3d.com/unity

download() {
  file=$1
  url="${BASE_URL}/${UNITY_HASH}/${package}"

  echo "Downloading from $url: "
  curl -o `basename "${package}"` "$url"
}

install() {
  package=$1
  download "${package}"

  echo "Installing "`basename "${package}"`
  sudo installer -dumplog -package `basename "${package}"` -target /
}

# See $BASE_URL/$UNITY_HASH/unity-$UNITY_VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`

install "MacEditorInstaller/Unity-${UNITY_VERSION}.pkg"
