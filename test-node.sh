#!/bin/bash

cd src &&
    npm install &&
    (node server.express.js &) &&
    PID=${?} &&
    sleep 10s &&
    EXPECTED="Hello World!" &&
    OBSERVED=$(curl http://localhost:3000) &&
    if [[ "${OBSERVED}" == "${EXPECTED}" ]]
    then
	echo "The server is working" &&
	    true
    else
	echo "The server is not working." &&
	    echo "We were expecting: ${EXPECTED}" &&
	    echo "but we observed: ${OBSERVED}" &&
	    kill ${PID} &&
	    exit 64 &&
	    true
    fi &&
    true
