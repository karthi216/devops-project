#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=/tmp/response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
    read line
    echo $line
}

handleRequest() {
    get_api
    mod=$(fortune)

    cat <<EOF > $RSPFILE
HTTP/1.1 200 OK

<pre>$(cowsay "$mod")</pre>
EOF
}

prerequisites() {
    command -v cowsay >/dev/null 2>&1 || { echo "cowsay missing"; exit 1; }
    command -v fortune >/dev/null 2>&1 || { echo "fortune missing"; exit 1; }
    command -v nc >/dev/null 2>&1 || { echo "netcat missing"; exit 1; }
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        cat $RSPFILE | nc -l 0.0.0.0 $SRVPORT -q 1 | handleRequest
        sleep 0.01
    done
}

main






