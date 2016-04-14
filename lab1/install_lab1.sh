#!/bin/bash

COURSE_DIR=${COURSE_DIR:="${HOME}/avdark"}

AVDARK_PIN_VERSION=pin-2.11-49306-gcc.3.4.6-ia32_intel64-linux

PIN_VERSION_DIR=${COURSE_DIR}/pin-${AVDARK_PIN_VERSION}
PIN_CURRENT=${COURSE_DIR}/pin

PIN_URL="https://www.dropbox.com/s/4spvflnb061z16e/pin-2.11-49306-gcc.3.4.6-ia32_intel64-linux.tar.gz?dl=0"

SRC_URL='https://www.dropbox.com/s/x7umnzxxsu9ko9a/lab1.tar?dl=0'

LAB_NAME="lab1"
LAB_DIR="${COURSE_DIR}/${LAB_NAME}"

if [ -e "$LAB_DIR" ]; then
    echo "The lab directory ($LAB_DIR) already exist."
else

    # Setup course directory
    echo "Creating ${LAB_DIR} directory ${LAB_DIR}"
    mkdir -p "${LAB_DIR}"

    cd "${LAB_DIR}"

    echo -n "Downloading lab source files..."
    wget -O "${COURSE_DIR}"/lab1.tar $SRC_URL
    echo " done."

    echo "Extracting lab source files"
    tar --strip-components 1 -xf ../lab1.tar

fi

cd "${COURSE_DIR}"
if [ -e ${PIN_CURRENT} ]; then
    echo "There is already a PIN version installed in the course directory"
else

	echo -n "Downloading pin tool..."
	wget -O "${COURSE_DIR}"/"pin-${AVDARK_PIN_VERSION}.tar.gz" "${PIN_URL}"
	echo " done."

	echo "Decompressing PIN..."
	tar zxf ${COURSE_DIR}/pin-${AVDARK_PIN_VERSION}.tar.gz

	echo "Setting up a symlink to the current PIN version..."
	ln -s $PIN_VERSION_DIR $PIN_CURRENT

    echo "Done. Pin has been installed in: $PIN_CURRENT"
fi

