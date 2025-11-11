#!/bin/sh

writefile="${1}"
writestr="${2}"
number_args=2
if [ ${#} -ne "${number_args}" ]
then
    echo "Number opf args should be 2"
    exit 1
fi

dirpath=$(dirname "$writefile")

if [ ! -d "${dirpath}" ]
then
    mkdir -p "${dirpath}"
    if [ $? -ne 0 ]
    then
        echo "could not create directory "${dirpath}""
        exit 1
    fi
fi

echo "${writestr}" > "${writefile}"

if [ $? -ne 0 ]
then 
    echo "Error could not create file "${writefile}""
    exit 1
fi

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null