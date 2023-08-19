#!/bin/bash
server_id=$1
download=$(speedtest-cli --server $server_id --no-upload | grep 'Download:' | awk '{print $2}')
echo $download
