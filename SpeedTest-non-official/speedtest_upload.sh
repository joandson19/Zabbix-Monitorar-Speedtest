#!/bin/bash
server_id=$1
upload=$(speedtest-cli --server $server_id --no-download | grep 'Upload:' | awk '{print $2}')
echo $upload
